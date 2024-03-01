# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kcolorpicker
pkgver=0.3.1
pkgrel=1
pkgdesc='Qt based Color Picker with popup menu'
arch=(x86_64)
url='https://github.com/DamirPorobic/kColorPicker'
license=(LGPL-3.0-only)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake)
conflicts=(kcolorpicker-qt6)
replaces=(kcolorpicker-qt6)
source=(https://github.com/ksnip/kColorPicker/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e78c785ec4a8a22a48a91835c97601f5704b5076b154415353b0d2697dc0b4f7')

build() {
  cmake -B build -S kColorPicker-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
