import '../ffi_normal.dart';
import 'ffigen/two_num_add.dart';
import 'native_use/message_interaction.dart';
import 'native_use/sync_callback.dart';
import 'native_use/sync_invoke.dart';

class NativeInvoke {
  /// 同步触发
  static int addSyncInvoke(int a, int b) => ffiAddSyncInvoke(a, b);

  static int addSyncInvokeGen(int a, int b) => NativeLibrary(NativeFFI.dyLib).twoNumAddGen(a, b);

  /// 在native层打印回调传入的值
  static void printSyncCallback() => ffiPrintSyncCallback();

  static void asyncMsg(int a) => ffiAsyncMsg(a);
}
