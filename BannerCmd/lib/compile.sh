#!/bin/sh

export SDKNAME="iphoneos"
export PLATFORM_NAME=${SDKNAME}

export CXX="$(xcrun --sdk ${SDKNAME} -f clang++)"
export CC="$(xcrun --sdk ${SDKNAME} -f clang)"
export CPP="$(xcrun --sdk ${SDKNAME} -f cpp)"
export AR="$(xcrun --sdk ${SDKNAME} -f ar)"
export AS="$(xcrun --sdk ${SDKNAME} -f as)"
export LD="$(xcrun --sdk ${SDKNAME} -f ld)"
export LIBTOOL="$(xcrun --sdk ${SDKNAME} -f libtool)"
export STRIP="$(xcrun --sdk ${SDKNAME} -f strip)"
export RANLIB="$(xcrun --sdk ${SDKNAME} -f ranlib)"

export BUILD_DIR="$(pwd)/build"
export ARCHS_IPHONE_OS="-arch armv7"
#-arch armv7 -arch armv7s -arch arm64
export SDKROOT="$(xcrun --sdk ${SDKNAME} --show-sdk-path)"
export CFLAGS="-isysroot $SDKROOT $ARCHS_IPHONE_OS -miphoneos-version-min=7.0"
export CXXFLAGS=$CFLAGS

make distclean
./configure \
  --host=arm-apple-darwin \
  --prefix=$BUILD_DIR \
  --disable-shared



#export SDKNAME="iphonesimulator"
#export PLATFORM_NAME=${SDKNAME}
#
#export CXX="$(xcrun --sdk ${SDKNAME} -f clang++)"
#export CC="$(xcrun --sdk ${SDKNAME} -f clang)"
#export CPP="$(xcrun --sdk ${SDKNAME} -f cpp)"
#export AR="$(xcrun --sdk ${SDKNAME} -f ar)"
#export AS="$(xcrun --sdk ${SDKNAME} -f as)"
#export LD="$(xcrun --sdk ${SDKNAME} -f ld)"
#export LIBTOOL="$(xcrun --sdk ${SDKNAME} -f libtool)"
#export STRIP="$(xcrun --sdk ${SDKNAME} -f strip)"
#export RANLIB="$(xcrun --sdk ${SDKNAME} -f ranlib)"
#
#export BUILD_DIR="$(pwd)/build"
#export ARCHS_IPHONE_SIMULATOR="-arch i386 -arch x86_64"
##-arch armv7 -arch armv7s -arch arm64
#export SDKROOT="$(xcrun --sdk ${SDKNAME} --show-sdk-path)"
#export CFLAGS="-isysroot $SDKROOT $ARCHS_IPHONE_SIMULATOR -miphoneos-version-min=7.0"
#export CXXFLAGS=$CFLAGS
#
#make distclean
#./configure \
#  --prefix=$BUILD_DIR \
#  --disable-shared
#
#make
