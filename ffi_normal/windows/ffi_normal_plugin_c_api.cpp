#include "include/ffi_normal/ffi_normal_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "ffi_normal_plugin.h"

void FfiNormalPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ffi_normal::FfiNormalPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
