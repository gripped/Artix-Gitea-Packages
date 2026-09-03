# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=1.0.0
pkgrel=2
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
  # opencv - requires version 4, but we package v5
  python
  qt6-base
)
makedepends=(
  git
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
  qt6-svg
)
provides=(libopenshot.so)
source=(
  "git+$url#tag=v${pkgver}"
  "$pkgname-1.0.0-opencv4-off.patch"
  "$pkgname-1.0.0-beatsync-except.patch"
)
sha512sums=('e17f8295dba8defad07b44d53bac254318c4796b5366b55b07bdc4ffd896327dc3d16a30ca97382e5f3c19f9d61b05902001dc27f3ead9be2e60d397138a343c'
            '0b0898525aee02ab90d3534042f8e5f064a21253a0d99ba51e96be5b57d31060dc8dd75f8984661fa36dadde4a496a865c3b498d402fa4968baeb219f65b4c4d'
            '1a90815dfcf8ce3b2c4c98b343659ed9d5f126fabdcbcf994958c6893bb0b4fdc05b89bfa80e9b13a7d0f5bb7494f727b071cd92b4b1dd822a6319cd1e779821')
b2sums=('7938e83bc8bb728a614de31926f115812ce274f8a99fe522fa2c2802b966565961a77b572ee5936c7c0a5086f0d4f8e5dfaef4c7aaecaf150ee47067c854864e'
        'de35bdc7fee5d001c093f79c0273a0fe498d62ee45d58098b0f463edff539308bcfce1b11924571177790a915b147f5c4fa70000bd381ff70e0d83a8f3180a2b'
        '24914858eba2037acb02a323caea1334c2d1566e0fe0dc24302222451b911243d925ea205533c8b5b39cb2c02f64d782009cbbb226c2f04ca413e6f7685ef0fe')

prepare() {
  cd "$pkgname"
  # protobuf 23 requiers C++17
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -i CMakeLists.txt
  # Requires OpenCV 4, but we package 5. Still tries to build demos with OpenCV despite being disabled.
  patch -Np1 < "$srcdir/$pkgname-1.0.0-opencv4-off.patch"
  # fix building tests
  patch -Np1 < "$srcdir/$pkgname-1.0.0-beatsync-except.patch"
}

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_RUBY=OFF
    -D PYTHON_INCLUDE_DIRS="/usr/include/python$python_version"
    -D PYTHON_LIBRARIES=/usr/lib/libpython3.so
    -D USE_SYSTEM_JSONCPP=ON
    -D USE_QT6=ON
    -S "$pkgname"
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
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname/" "$pkgname"/{AUTHORS,README.md}
}

# vim: sw=2 et
