import 'dart:ffi';

import '../native_ffi.dart';

/// 传递的回调
typedef _NativeCallback = Int32 Function(Int32 num);

/// Native方法
typedef _NativeSyncCallback = Void Function(
  Pointer<NativeFunction<_NativeCallback>> callback,
);

/// Dart结束回调: Void和void不同,所以要区分开
typedef _DartSyncCallback = void Function(
  Pointer<NativeFunction<_NativeCallback>> callback,
);

/// 必须使用顶层方法或者静态方法
/// macos端可以打印出native层日志, 移动端只能打印dart日志
int _syncCallback(int num) {
  print('--------');
  return num;
}

/// 在native层打印回调传入的值
void ffiPrintSyncCallback() {
  final _DartSyncCallback dartSyncCallback = NativeFFI.dyLib
      .lookup<NativeFunction<_NativeSyncCallback>>("nativeSyncCallback")
      .asFunction();

  // 包装传递的回调
  var syncFun = Pointer.fromFunction<_NativeCallback>(_syncCallback, 0);
  dartSyncCallback(syncFun);
}