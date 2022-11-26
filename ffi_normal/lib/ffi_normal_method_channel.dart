import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ffi_normal_platform_interface.dart';

/// An implementation of [FfiNormalPlatform] that uses method channels.
class MethodChannelFfiNormal extends FfiNormalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ffi_normal');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
