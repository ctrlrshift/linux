#!/bin/bash
# clang 14

git clone https://gitlab.com/mcdofrenchfreis/android-clang-14.0.7.git toolchain

export PATH=toolchain/bin:$PATH
export CROSS_COMPILE=toolchain/bin/aarch64-linux-gnu-
export CC=toolchain/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 a05m_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 -j16

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
