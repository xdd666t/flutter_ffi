# flutter_ffi
- 安装 rust：https://www.rust-lang.org/zh-CN/tools/install

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

- 编译iOS，按需执行下述命令

```bash
# 64 bit targets (真机 & 模拟器):
rustup target add aarch64-apple-ios x86_64-apple-ios
# New simulator target for Xcode 12 and later
rustup target add aarch64-apple-ios-sim
```
