// C
#include <stdio.h>

// Unix
#include <unistd.h>
#include <pthread.h>

#include "dart_api/dart_api.h"
#include "dart_api/dart_native_api.h"

#include "dart_api/dart_api_dl.h"

// Initialize `dart_api_dl.h`
DART_EXPORT intptr_t InitDartApiDL(void* data) {
  return Dart_InitializeApiDL(data);
}

Dart_Port send_port_;

DART_EXPORT void RegisterSendPort(Dart_Port send_port) {
  send_port_ = send_port;
}

void *thread_func(void *args) {
    printf("thread_func Running on (%p)\n", pthread_self());
    sleep(2 /* seconds */); // doing something

    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kInt64;
    dart_object.value.as_int64 = reinterpret_cast<intptr_t>(args);
    Dart_PostCObject_DL(send_port_, &dart_object);

    pthread_exit(args);
}

DART_EXPORT void NativeAsyncMessage(int32_t x) {
    printf("NativeAsyncCallback Running on (%p)\n", pthread_self());

    pthread_t message_thread;
    pthread_create(&message_thread, NULL, thread_func, (void *)&x);
}