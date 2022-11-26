//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <ffi_normal/ffi_normal_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) ffi_normal_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FfiNormalPlugin");
  ffi_normal_plugin_register_with_registrar(ffi_normal_registrar);
}
