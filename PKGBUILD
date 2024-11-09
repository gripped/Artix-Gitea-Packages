# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.3.1
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         imath
         libdeflate)
makedepends=(cmake
             git)
source=(git+https://github.com/openexr/openexr#tag=v$pkgver)
sha256sums=('5c60e410e60bc424a27c1a7865b26a1f8eaacb46ecc643f925c521a8f922fa64')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
