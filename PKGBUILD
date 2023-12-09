# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Maxime Arthaud <maxime@arthaud.me>

pkgname=zxing-cpp
pkgver=2.2.0
pkgrel=1
pkgdesc='A C++ library to decode QRCode'
arch=(x86_64)
url='https://github.com/nu-book/zxing-cpp'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake)
checkdepends=(gtest)
source=(https://github.com/nu-book/zxing-cpp/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6df336573c777d0d826f4993d06c4feeebe5a8f97e1c8e80a6e6233fe7c62eac')

build() {
  artix-cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_UNIT_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
