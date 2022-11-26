# cmake_minimum_required 表示支持的 cmake 最小版本
cmake_minimum_required(VERSION 3.4.1)

# 项目名称
set(PROJECT_NAME "native_fun")

# 批量添加cpp文件
# add_library 关键字表示构建链接库，参数1是链接包名称; 参数2'SHARED'表示构建动态链接库; 参数2是源文件列表
file(GLOB_RECURSE native_batch ../ios/Classes/native/*)
add_library(${PROJECT_NAME} SHARED ${native_batch})