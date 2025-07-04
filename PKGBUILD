# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=mimetreeparser
pkgver=25.04.3
pkgrel=1
pkgdesc='Parser for MIME trees'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         gpgmepp
         kcalendarcore
         ki18n
         kirigami
         kmbox
         kmime
         kwidgetsaddons
         libkleo
         qgpgme
         qt6-base
         qt6-declarative
         qt6-webengine)
makedepends=(doxygen
             extra-cmake-modules
             qt6-doc
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('26a4440d50ca62db1f154794557d5a216acc44ae96347e072200255a267c4ac4'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
