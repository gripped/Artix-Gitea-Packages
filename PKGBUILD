# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons
pkgver=1.5.1
pkgrel=1
pkgdesc='Various text handling addons'
arch=(x86_64)
license=(GPL)
url='https://invent.kde.org/libraries/ktextaddons'
depends=(gcc-libs
         glibc
         karchive
         kconfig
         kconfigwidgets
         ki18n
         kio
         kwidgetsaddons
         qt5-base
         qt5-speech
         qtkeychain-qt5
         sonnet
         syntax-highlighting)
makedepends=(doxygen
             extra-cmake-modules
             qt5-tools)
optdepends=('languagetool: Grammar checking'
            'grammalecte: French grammar checking'
            'libreoffice: Use autocorrection data from LibreOffice')
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('a72d7c4fc9802cb96a50ad7f5668205c79566db47512029c85786e2c6519cc48')

build() {
  artix-cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESIGNERPLUGIN=ON \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
