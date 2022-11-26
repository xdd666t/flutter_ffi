import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ffi_normal_method_channel.dart';

abstract class FfiNormalPlatform extends PlatformInterface {
  /// Constructs a FfiNormalPlatform.
  FfiNormalPlatform() : super(token: _token);

  static final Object _token = Object();

  static FfiNormalPlatform _instance = MethodChannelFfiNormal();

  /// The default instance of [FfiNormalPlatform] to use.
  ///
  /// Defaults to [MethodChannelFfiNormal].
  static FfiNormalPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FfiNormalPlatform] when
  /// they register themselves.
  static set instance(FfiNormalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
