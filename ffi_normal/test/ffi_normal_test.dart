import 'package:flutter_test/flutter_test.dart';
import 'package:ffi_normal/ffi_normal.dart';
import 'package:ffi_normal/ffi_normal_platform_interface.dart';
import 'package:ffi_normal/ffi_normal_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFfiNormalPlatform
    with MockPlatformInterfaceMixin
    implements FfiNormalPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FfiNormalPlatform initialPlatform = FfiNormalPlatform.instance;

  test('$MethodChannelFfiNormal is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFfiNormal>());
  });

  test('getPlatformVersion', () async {
    FfiNormal ffiNormalPlugin = FfiNormal();
    MockFfiNormalPlatform fakePlatform = MockFfiNormalPlatform();
    FfiNormalPlatform.instance = fakePlatform;

    expect(await ffiNormalPlugin.getPlatformVersion(), '42');
  });
}
