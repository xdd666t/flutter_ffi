
import 'ffi_normal_platform_interface.dart';

class FfiNormal {
  Future<String?> getPlatformVersion() {
    return FfiNormalPlatform.instance.getPlatformVersion();
  }
}
