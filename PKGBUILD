# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kopeninghours
pkgver=23.08.5
pkgrel=1
pkgdesc='Library for parsing and evaluating OSM opening hours expressions'
arch=(x86_64)
url='https://www.kde.org'
license=(LGPL)
depends=(kholidays5 ki18n5)
makedepends=(extra-cmake-modules python qt5-tools doxygen boost)
optdepends=('boost-libs: Python bindings' 'python: Python bindings')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('262c4cf75e99c3989ce2150c467196ed0c5ae803d674e9372faa70d57d931946'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  artix-cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
