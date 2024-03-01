# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.6.1
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libexpat.so)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/$pkgname-$pkgver.tar.bz2{,.asc})
sha512sums=('11029a25cc88e5428c04c1ee9d3e8833f3d1c0a957350b0038eadb786821d2dd4c57c34fe67b45389c43d558ee53d4b95dcf1e5116aaf9ca16b12c1af6fbb7f0'
            'SKIP')
b2sums=('b10658e793cd080c90f4be48c5c3c877d6463aa226bd77e48622d4ccc8e27367d4abf2f07a43dc4507494e9ce1d449a1c3a9d8a2b5c85e45e6c0e0062ea21bde'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,Changes,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
