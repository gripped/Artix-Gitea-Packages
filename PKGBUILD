# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-python
pkgver=24.08.3
pkgrel=2
pkgdesc='Python language and documentation plugin for KDevelop'
arch=(x86_64)
url='https://www.kdevelop.org/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kdevelop
         ki18n
         kparts
         ktexteditor
         kwidgetsaddons
         kxmlgui
         python
         qt6-base
         threadweaver)
makedepends=(extra-cmake-modules)
optdepends=('python-pycodestyle: for Python style checking')
groups=(kde-applications
        kdevelop)
source=(https://download.kde.org/stable/release-service/$pkgver/src/kdev-python-$pkgver.tar.xz{,.sig}
        python-3.13.patch)
sha256sums=('05644c30030bfd51cb541f803f05a42014cb5edf9ff5ebc23858211ace0ddcc2'
            'SKIP'
            '06f8e8cd1f6a8bb47753fafc01267bd5ea3974c54b559a35d21fcaaa71e95589')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  sed -e 's|<3.13|<3.14|' -i kdev-python-$pkgver/CMakeLists.txt # Accept Python 3.13
  patch -d kdev-python-$pkgver -p1 < python-3.13.patch
}

build() {
  cmake -B build -S kdev-python-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
