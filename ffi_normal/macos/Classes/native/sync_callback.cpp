#include <stdint.h>
#include <iostream>

#ifdef WIN32
#define DART_API extern "C" __declspec(dllexport)
#else
#define DART_API extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

using namespace std;

// 定义传递的回调类型
typedef int32_t (*NativeCallback)(int32_t n);

DART_API void nativeSyncCallback(NativeCallback callback) {
    // 打印
    std::cout << "native log callback(666) = " << callback(666) << std::endl;
}