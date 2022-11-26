#ifndef FLUTTER_PLUGIN_FFI_NORMAL_PLUGIN_H_
#define FLUTTER_PLUGIN_FFI_NORMAL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace ffi_normal {

class FfiNormalPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FfiNormalPlugin();

  virtual ~FfiNormalPlugin();

  // Disallow copy and assign.
  FfiNormalPlugin(const FfiNormalPlugin&) = delete;
  FfiNormalPlugin& operator=(const FfiNormalPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace ffi_normal

#endif  // FLUTTER_PLUGIN_FFI_NORMAL_PLUGIN_H_
