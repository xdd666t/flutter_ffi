#include <stdint.h>

#ifdef WIN32
#define DART_API extern "C" __declspec(dllexport)
#else
#define DART_API extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

DART_API int32_t twoNumAdd(int32_t x, int32_t y){
    return x + y;
}