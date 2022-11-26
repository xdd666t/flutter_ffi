import 'dart:ffi';
import 'dart:io';

class NativeFFI {
  NativeFFI._();

  static DynamicLibrary? _dyLib;

  static DynamicLibrary get dyLib {
    if (_dyLib != null) return _dyLib!;

    if (Platform.isMacOS || Platform.isIOS) {
      _dyLib = DynamicLibrary.process();
    } else if (Platform.isAndroid) {
      _dyLib = DynamicLibrary.open('libnative_fun.so');
    } else if (Platform.isWindows) {
      _dyLib = DynamicLibrary.open('libnative_fun.dll');
    } else {
      throw Exception('DynamicLibrary初始化失败');
    }

    return _dyLib!;
  }
}
