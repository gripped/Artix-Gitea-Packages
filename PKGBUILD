# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.7.0
pkgrel=1.3
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=(x86_64)
url="https://github.com/openshot/libopenshot"
license=(LGPL-3.0-or-later)
depends=(
  babl
  libgomp
  libstdc++
  libgcc
  glibc
  libmagick
  opencv
  python
  qt5-base
)
makedepends=(
  catch2
  cmake
  cppzmq
  doxygen
  ffmpeg4.4
  jsoncpp
  libopenshot-audio
  protobuf
  python-setuptools
  swig
  unittestpp
  xorg-server-xvfb
  zeromq
  qt5-svg
)
provides=(libopenshot.so)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('d36ad17e65534c890358ea7a12b039e94296327341835f39c5d76d257f5be5e8f874124b51005cd710cfc668a44dd898f63de2c674544d30b5a9d012273f56ce')
b2sums=('3c11f13d881b798e173c685f20700a2e060606a852834905547d971a569d85ccd7951753f4de2d119caebfacd1917df30c8038c6b69f3c9d31560c92e9b361d4')

prepare() {
# protobuf 23 requiers C++17
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_RUBY=OFF
    -D PYTHON_INCLUDE_DIRS=/usr/include/python$python_version
    -D PYTHON_LIBRARIES=/usr/lib/libpython3.so
    -D USE_SYSTEM_JSONCPP=ON
    -S $pkgname-$pkgver
    -W no-dev
  )

  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  # disable broken tests, upstream output expectations do not track dependency changes:
  # - https://github.com/OpenShot/libopenshot/issues/922
  # - https://github.com/OpenShot/libopenshot/issues/948
  local excluded_tests=(
    'Caption:caption effect'
    'FFmpegWriter:DisplayInfo'
    'FFmpegWriter:Options_Overloads'
    'FFmpegWriter:Webm'
  )
  local IFS='|'
  xvfb-run ctest --test-dir build --output-on-failure -E "(${excluded_tests[*]})"
}


package() {
  depends+=(
    ffmpeg4.4 libavcodec.so libavformat.so libavutil.so libswscale.so libswresample.so
    jsoncpp libjsoncpp.so
    libopenshot-audio libopenshot-audio.so
    protobuf libprotobuf.so
    zeromq libzmq.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
