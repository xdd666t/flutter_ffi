import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';

import 'package:flutter/material.dart';

import '../../ffi_normal.dart';

ReceivePort? _receivePort;
StreamSubscription? _subscription;

void _ensureNativeInitialized() {
  if (_receivePort == null) {
    WidgetsFlutterBinding.ensureInitialized();
    final initializeApi = NativeFFI.dyLib.lookupFunction<
        IntPtr Function(Pointer<Void>),
        int Function(Pointer<Void>)>("InitDartApiDL");
    if (initializeApi(NativeApi.initializeApiDLData) != 0) {
      throw "Failed to initialize Dart API";
    }

    _receivePort = ReceivePort();
    _subscription = _receivePort!.listen(_handleNativeMessage);
    final registerSendPort = NativeFFI.dyLib.lookupFunction<
        Void Function(Int64 sendPort),
        void Function(int sendPort)>('RegisterSendPort');
    registerSendPort(_receivePort!.sendPort.nativePort);
  }
}

void _handleNativeMessage(dynamic address) {
  print('---------native端通信,地址: $address');
  Pointer<Int32> point = Pointer<Int32>.fromAddress(address);
  print('---------native端通信,指针: $point');
  dynamic data = point.cast();
  print('---------native端通信,cast: $data');
}

void ffiAsyncMsg(int a) {
  _ensureNativeInitialized();
  final void Function(int x) asyncMessage = NativeFFI.dyLib
      .lookup<NativeFunction<Void Function(Int32)>>("NativeAsyncMessage")
      .asFunction();

  asyncMessage(a);
}

void dispose() {
  // TODO _unregisterReceivePort(_receivePort.sendPort.nativePort);
  _subscription?.cancel();
  _receivePort?.close();
}
