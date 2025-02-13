# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-common
pkgver=0.11.1
pkgrel=1
pkgdesc='Core c99 package for AWS SDK for C. Includes cross-platform primitives, configuration, data structures, and error handling'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-common'
license=(Apache-2.0)
depends=(glibc)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b442cc59f507fbe232c0ae433c836deff83330270a58fa13bf360562efda368a')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
