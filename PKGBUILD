# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knewstuff
pkgver=6.0.0
pkgrel=3
pkgdesc='Support for downloading application assets from the network'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(attica
         gcc-libs
         glibc
         karchive
         kconfig
         kcoreaddons
         ki18n
         kpackage
         kwidgetsaddons
         qt6-base
         syndication)
makedepends=(doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-doc
             qt6-tools)
optdepends=('kirigami: QML components'
            'knewstuff: QML components'
            'qt6-5compat: QML components'
            'qt6-declarative: QML components')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/knewstuff/-/commit/4f01e2ff.patch)
sha256sums=('0299dba980590bd7c74870a74c6bb6ca732af478ab2c9ba414943f62ea0be0fa'
            'SKIP'
            'dec069302c5fd27594763ff4c67666c33625c3d63cb50f5ece39c14334cacc20')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 4f01e2ff.patch # Fix Get New... buttons with Qt 6.7
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
