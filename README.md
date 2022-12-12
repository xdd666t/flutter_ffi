# flutter_ffi

- 该库配置说明：https://juejin.cn/post/7176077601746714681

- 安装 rust：https://www.rust-lang.org/zh-CN/tools/install

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

# Windows

- 在windows上安装编译生成库，需要安装指定版本

```bash
# 指定版本
cargo install flutter_rust_bridge_codegen --version 1.51.0  --force
```

- 然后重新执行生成命令

```
flutter_rust_bridge_codegen -r rust/src/api.rs -d lib/ffi/rust_ffi/rust_ffi.dart -c ios/Runner/bridge_generated.h -c macos/Runner/bridge_generated.h
```

# iOS

- 编译iOS，按需执行下述命令

```bash
# 64 bit targets (真机 & 模拟器):
rustup target add aarch64-apple-ios x86_64-apple-ios
# New simulator target for Xcode 12 and later
rustup target add aarch64-apple-ios-sim
```
