# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kidentitymanagement
pkgver=26.03.90
pkgrel=1
pkgdesc='Library to assist in handling user identities'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcodecs
         kcompletion
         kconfig
         kcoreaddons
         ki18n
         kio
         kpimtextedit
         ktextaddons
         kwidgetsaddons
         kxmlgui
         qt6-base)
makedepends=(extra-cmake-modules
             kirigami-addons)
optdepends=('kirigami-addons: QML bindings'
            'qt6-declarative: QML bindings')
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('eb4fbb3e1e72d40f4c6cb4f7ce8c90a16450c63797a207cfe34f55f926322d77'
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
