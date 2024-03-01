# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgbase=kcolorpicker
pkgname=(kcolorpicker
         kcolorpicker-qt5)
pkgver=0.3.1
pkgrel=3
pkgdesc='Qt based Color Picker with popup menu'
arch=(x86_64)
url='https://github.com/DamirPorobic/kColorPicker'
license=(LGPL-3.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cmake
             qt5-base
             qt6-base)
source=(https://github.com/ksnip/kColorPicker/archive/v$pkgver/$pkgbase-$pkgver.tar.gz)
sha256sums=('e78c785ec4a8a22a48a91835c97601f5704b5076b154415353b0d2697dc0b4f7')

build() {
  cmake -B build5 -S kColorPicker-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build5

  cmake -B build -S kColorPicker-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package_kcolorpicker-qt5() {
  depends+=(qt5-base)

  DESTDIR="$pkgdir" cmake --install build5
}

package_kcolorpicker() {
  depends+=(qt6-base)
  conflicts=(kcolorpicker-qt5
             kcolorpicker-qt6)
  replaces=(kcolorpicker-qt6)

  DESTDIR="$pkgdir" cmake --install build
}
