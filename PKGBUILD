# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.11.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
_url="https://github.com/libexpat/libexpat"
license=(MIT)
depends=(glibc)
makedepends=(
  cmake
  git
)
provides=(libexpat.so)
source=($pkgname::git+$_url?signed#tag=R_${pkgver//./_})
sha512sums=('74e7b9d54cd697992d71e5115f912fda8fc55a6ee0190d604c93dc88efaa31218a40991ac983f4d5a8ff9a1bcbdbad923bde70326bf36472ac274e9f4c6ea663')
b2sums=('34538c6106e8f0157e9f708bbf228bafd5a4355e32cb0ae2ff106d4036642f0fd559404bc20c14538605082b44aad94004bc43c781c220f5ce5fa954125c5486')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname/$pkgname
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
  install -vDm 644 $pkgname/$pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname/$pkgname/{AUTHORS,Changes,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
