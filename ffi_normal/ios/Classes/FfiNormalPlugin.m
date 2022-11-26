#import "FfiNormalPlugin.h"
#if __has_include(<ffi_normal/ffi_normal-Swift.h>)
#import <ffi_normal/ffi_normal-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ffi_normal-Swift.h"
#endif

@implementation FfiNormalPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFfiNormalPlugin registerWithRegistrar:registrar];
}
@end
