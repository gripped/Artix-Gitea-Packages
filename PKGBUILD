# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=grantleetheme
pkgver=26.03.80
pkgrel=1
pkgdesc='Library for Grantlee theming support'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcolorscheme
         kconfig
         kcoreaddons
         kguiaddons
         ki18n
         kiconthemes
         knewstuff
         ktexttemplate
         kwidgetsaddons
         kxmlgui
         qt6-base)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('f406d37bb25b1ebb844f8a2180252f56e86e150c87c370da3dbfdb1f4fd3a882'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
