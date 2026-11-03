# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=1.1.1
pkgrel=1
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
  ffmpeg
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
  "https://raw.githubusercontent.com/OpenMandrivaAssociation/libopenshot/refs/heads/master/libopenshot-1.1.0-lerp.patch"
)
sha512sums=('8ad75fa40c6ab2eb5b975b877f6c81d56f2c1e07972b74c1f9d6465caae222093ee8ffa14e870fb3a2143e5e53cab2dd748241e1581c2b07e4ebe3531b40c82d'
            '1eb5c42e11030fb6e232511077e63f11cff2fefa6592bdb0de7c99f1323c37f4f61fc3bcfe312a4b10218f691abea6b6f4720944f54842c2cb0d90551e9eeb8c'
            '1a90815dfcf8ce3b2c4c98b343659ed9d5f126fabdcbcf994958c6893bb0b4fdc05b89bfa80e9b13a7d0f5bb7494f727b071cd92b4b1dd822a6319cd1e779821'
            '37b2616f5961042d73bfa8905326f67bf0c757f4f648563ffc046a8a5741ca5b9904cbb062432b0ed041dfc63b78a6abdd2343e468bb0e59216486f8f9f6c14d')
b2sums=('f977f967d860a9c49b35959657da27cb24250e291db535bee993a12169320d637687ebb465248d5158f9ab4bc0573dfe4633b209ffd276cee9307ec4b4823305'
        'c74323a2f6028b96471d54bd494bd138b20d77b8035ecb14bbb59ab7a52641c3088ec334770fbd5dacba476c275cd1bc09a819163a243f1f9523b3a75c8d4911'
        '24914858eba2037acb02a323caea1334c2d1566e0fe0dc24302222451b911243d925ea205533c8b5b39cb2c02f64d782009cbbb226c2f04ca413e6f7685ef0fe'
        '267532e106bb881a37f66434f2dba63d18603638e5cde3130d7b91341300dc58635bf72e81c3b72a0c36b6f444745f185dd8e7bf5ef68e458f56d15b5678b561')

prepare() {
  cd "$pkgname"
  # protobuf 23 requiers C++17
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -i CMakeLists.txt
  # Requires OpenCV 4, but we package 5. Still tries to build demos with OpenCV despite being disabled.
  patch -Np1 < "$srcdir/$pkgname-1.0.0-opencv4-off.patch"
  # fix building tests
  patch -Np1 < "$srcdir/$pkgname-1.0.0-beatsync-except.patch"
  # mandriva build fix
  patch -Np1 < "$srcdir/$pkgname-1.1.0-lerp.patch"
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

  #export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
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
  xvfb-run ctest --test-dir build --output-on-failure -E "(${excluded_tests[*]})" || :
}


package() {
  depends+=(
    ffmpeg libavcodec.so libavformat.so libavutil.so libswscale.so libswresample.so
    jsoncpp libjsoncpp.so
    libopenshot-audio libopenshot-audio.so
    protobuf libprotobuf.so
    zeromq libzmq.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname/" "$pkgname"/{AUTHORS,README.md}
}

# vim: sw=2 et
