# Maintainer: Artist for XLibre

pkgname=sonic-silver-theme
_pkgname=silver-theme
pkgver=6.5.1
pkgrel=3
pkgdesc='Highly customizable binary Window Decoration, Application Style and Global Theme plugin for the Sonic Desktop.'
arch=(x86_64)
url="https://github.com/Sonic-DE/silver-theme"
license=('LGPL-2.0-or-later')
depends=(breeze-icons
         hicolor-icon-theme
         frameworkintegration
         gcc-libs
         glibc
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kdecoration
         kguiaddons
         ki18n
         kiconthemes
         kirigami
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-declarative
         qt6-svg
         xdg-utils)
makedepends=(extra-cmake-modules)
groups=(sonicde)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c99c93f5e80fdc02c5de7922eeeef395b5bb7ff83d585686f5ad30bd953c94e4')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

