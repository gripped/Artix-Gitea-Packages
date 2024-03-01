# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kimageannotator
pkgver=0.7.1
pkgrel=1
pkgdesc='Tool for annotating images'
arch=(x86_64)
url='https://github.com/ksnip/kImageAnnotator'
license=(LGPL-3.0-only)
depends=(gcc-libs
         glibc
         kcolorpicker
         libx11
         qt6-base
         qt6-svg)
makedepends=(cmake
             qt6-tools)
conflicts=(kimageannotator-qt5
           kimageannotator-qt6)
replaces=(kimageannotator-qt6)
source=(https://github.com/ksnip/kImageAnnotator/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('79802e79074611599d5fd42be55c35832b6cb8178dcb6a6c5dec10efe38d1d7c')

build() {
  artix-cmake -B build -S kImageAnnotator-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
