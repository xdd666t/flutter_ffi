# cmake_minimum_required 表示支持的 cmake 最小版本
cmake_minimum_required(VERSION 3.4.1)

# 项目名称
if (WIN32)
    set(PROJECT_NAME "libnative_fun")
else()
    set(PROJECT_NAME "native_fun")
endif()

# 批量添加cpp文件
# add_library 关键字表示构建链接库，参数1是链接包名称; 参数2'SHARED'表示构建动态链接库; 参数2是源文件列表
file(GLOB_RECURSE native_batch ../../macos/Classes/native/*)
add_library(${PROJECT_NAME} SHARED ${native_batch})

# Windows 需要把dll拷贝到bin目录
if (WIN32)
    # 动态库的输出目录
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<$<CONFIG:DEBUG>:Debug>$<$<CONFIG:RELEASE>:Release>")
    # 安装动态库的目标目录
    set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")
    # 安装动态库，到执行目录
    install(FILES "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${PROJECT_NAME}.dll" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
endif()