export ARCH=arm64
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
export PATH="/workspace/gitpod/proton-clang/bin:$PATH" #path to proton
INSTALL_MOD_PATH=/workspace/gitpod/Darkphantom_kernel/dist/lib/modules
clear
mkdir out

ARGS="
CC=clang
CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_ARM32=arm-linux-gnueabi-
AR=llvm-ar
NM=llvm-nm
OBJCOPY=llvm-objcopy
OBJDUMP=llvm-objdump
STRIP=llvm-strip
ARCH=arm64
"
make -j8 -C $(pwd) O=$(pwd)/out ${ARGS} clean && make -j8 -C $(pwd) O=$(pwd)/out ${ARGS} mrproper
make -j8 -C $(pwd) O=$(pwd)/out ${ARGS} X2_defconfig
make -j8 -C $(pwd) O=$(pwd)/out ${ARGS} menuconfig
make -j8 -C $(pwd) O=$(pwd)/out ${ARGS}