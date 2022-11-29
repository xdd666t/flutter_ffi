# 生成指令
flutter_rust_bridge_codegen -r rust/src/api.rs -d lib/ffi/rust_ffi/rust_ffi.dart -c ios/Runner/bridge_generated.h -c macos/Runner/bridge_generated.h

# 执行该命令: bash rust_gen.sh

