# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=minizip-ng
pkgver=4.1.2
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64)
url='https://github.com/zlib-ng/minizip-ng'
license=(Zlib)
depends=(bzip2
         glibc
         openssl
         xz
         zlib-ng
         zstd)
makedepends=(cmake
             git)
source=(git+https://github.com/zlib-ng/minizip-ng#tag=$pkgver)
sha256sums=('8f080428bf3b07595f8aa737ac78666caeb3d27ad23dbf9a1b39b6f829a685d4')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMZ_LIB_SUFFIX="-ng" \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
