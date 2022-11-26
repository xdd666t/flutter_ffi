import 'dart:ffi';

import '../native_ffi.dart';


/// 俩数相加
int ffiAddSyncInvoke(int a, int b) {
  final int Function(int x, int y) nativeAdd = NativeFFI.dyLib
      .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("twoNumAdd")
      .asFunction();

  return nativeAdd(a, b);
}
