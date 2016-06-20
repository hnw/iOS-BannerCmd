#!/bin/sh

BUILD_DIR="$(pwd)/build"
STATIC_LIB_NAME="banner.a"
STATIC_LIB_NAME_ARM="${STATIC_LIB_NAME}.arm"
STATIC_LIB_NAME_X86="${STATIC_LIB_NAME}.x86"

ARCHS_IPHONE_OS="-arch armv7 -arch armv7s -arch arm64"
ARCHS_IPHONE_SIMULATOR="-arch i386 -arch x86_64"

# build in terminal for armv7 armv7s arm64

export SDKNAME="iphoneos"
export PLATFORM_NAME=${SDKNAME}

export CC="$(xcrun --sdk ${SDKNAME} -f clang)"
export CPP="$(xcrun --sdk ${SDKNAME} -f cc) -E -D __arm__=1"
export CXX="$(xcrun --sdk ${SDKNAME} -f clang++)"
export AR="$(xcrun --sdk ${SDKNAME} -f ar)"
export AS="$(xcrun --sdk ${SDKNAME} -f as)"
export LD="$(xcrun --sdk ${SDKNAME} -f ld)"
export LIBTOOL="$(xcrun --sdk ${SDKNAME} -f libtool)"
export STRIP="$(xcrun --sdk ${SDKNAME} -f strip)"
export RANLIB="$(xcrun --sdk ${SDKNAME} -f ranlib)"

export SDKROOT="$(xcrun --sdk ${SDKNAME} --show-sdk-path)"
export CFLAGS="-isysroot $SDKROOT -mios-version-min=7.0 $ARCHS_IPHONE_OS"
export CPPFLAGS=""
export CXXFLAGS=$CFLAGS

make distclean
./configure \
  --host=arm-apple-darwin \
  --prefix=$BUILD_DIR \
  --disable-shared

make -j4
make install

# remane for arm arch
mv $BUILD_DIR/lib/$STATIC_LIB_NAME $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM

# build in terminal for i386 x86_64

export SDKNAME="iphonesimulator"
export PLATFORM_NAME=${SDKNAME}

export CC="$(xcrun --sdk ${SDKNAME} -f clang)"
export CPP="$(xcrun --sdk ${SDKNAME} -f cc) -E -D __arm__=1"
export CXX="$(xcrun --sdk ${SDKNAME} -f clang++)"
export AR="$(xcrun --sdk ${SDKNAME} -f ar)"
export AS="$(xcrun --sdk ${SDKNAME} -f as)"
export LD="$(xcrun --sdk ${SDKNAME} -f ld)"
export LIBTOOL="$(xcrun --sdk ${SDKNAME} -f libtool)"
export STRIP="$(xcrun --sdk ${SDKNAME} -f strip)"
export RANLIB="$(xcrun --sdk ${SDKNAME} -f ranlib)"

export SDKROOT="$(xcrun --sdk ${SDKNAME} --show-sdk-path)"
export CFLAGS="-isysroot $SDKROOT -mios-version-min=7.0 $ARCHS_IPHONE_SIMULATOR"
export CPPFLAGS=""
export CXXFLAGS=$CFLAGS

make distclean
./configure \
  --prefix=$BUILD_DIR \
  --disable-shared

make -j4
make install

# remane for x86 arch
mv $BUILD_DIR/lib/$STATIC_LIB_NAME $BUILD_DIR/lib/$STATIC_LIB_NAME_X86

lipo -create $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM $BUILD_DIR/lib/$STATIC_LIB_NAME_X86 -output $BUILD_DIR/lib/$STATIC_LIB_NAME

echo "************** Done **************"
lipo -info $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM $BUILD_DIR/lib/$STATIC_LIB_NAME_X86 $BUILD_DIR/lib/$STATIC_LIB_NAME
