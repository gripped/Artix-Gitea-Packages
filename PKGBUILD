# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=expat
pkgname=lib32-expat
pkgver=2.6.1
pkgrel=1
pkgdesc='An XML Parser library'
arch=(x86_64)
url=https://libexpat.github.io/
license=(MIT)
depends=(
  "expat=$pkgver"
  lib32-glibc
)
makedepends=(cmake)
provides=(libexpat.so)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/$_name-$pkgver.tar.bz2{,.asc})
sha512sums=('11029a25cc88e5428c04c1ee9d3e8833f3d1c0a957350b0038eadb786821d2dd4c57c34fe67b45389c43d558ee53d4b95dcf1e5116aaf9ca16b12c1af6fbb7f0'
            'SKIP')
b2sums=('b10658e793cd080c90f4be48c5c3c877d6463aa226bd77e48622d4ccc8e27367d4abf2f07a43dc4507494e9ce1d449a1c3a9d8a2b5c85e45e6c0e0062ea21bde'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_name-$pkgver
    -W no-dev
  )

  export CC='gcc -m32'
  export CXX='c++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir"/usr/{bin,include,share/man,share/doc}
}

# vim:set sw=2 sts=-1 et:
