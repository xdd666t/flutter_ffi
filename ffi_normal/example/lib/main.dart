import 'package:ffi_normal/ffi_normal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  int _countMSg = 9;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Wrap(spacing: 10, children: [
            // 同步调用
            ElevatedButton(
              onPressed: () {
                _count = NativeInvoke.addSyncInvokeGen(_count, 1);
                setState(() {});
              },
              child: Text('Count: $_count'),
            ),

            // 同步调用回调
            const ElevatedButton(
              onPressed: NativeInvoke.printSyncCallback,
              child: Text('syncCallback'),
            ),

            // 异步消息
            ElevatedButton(
              onPressed: () {
                _countMSg++;
                NativeInvoke.asyncMsg(_countMSg);
                setState(() {});
              },
              child: Text('asyncMsg: $_countMSg'),
            ),
          ]),
        ),
      ),
    );
  }
}
