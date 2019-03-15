#!/bin/bash
set -e
cd llvm && mkdir build && cd build
output=/tmp/llvm-build
projs="clang;clang-tools-extra;libcxx;compiler-rt"
cmake -DCMAKE_INSTALL_PREFIX=${output} \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_LIBCXX=ON \
      -DLLVM_ENABLE_CXX1Y=ON \
      -DLLVM_ENABLE_PROJECTS=${projs} \
      -DLLVM_CREATE_XCODE_TOOLCHAIN=ON \
      -GNinja \
      ..

ninja
ninja install-xcode-toolchain

echo build finish.
echo toolchain installed at ${output}