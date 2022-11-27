import 'package:rust_bridge/ffi/native_ffi.dart';
import 'package:rust_bridge/ffi/rust_ffi/rust_ffi.dart';

class NativeFun {
  static RustFfiImpl _ffi = RustFfiImpl(NativeFFI.dyLib);

  static Future<int> add(int left, int right) async {
    int sum = await _ffi.add(left: left, right: right);
    return sum;
  }
}
