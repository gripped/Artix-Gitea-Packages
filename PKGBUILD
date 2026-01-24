# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=webappcontainer
pkgver=1.4.0
pkgrel=1
pkgdesc="Open any web app in this single, light weight, portable application with a tray icon."
arch=(x86_64)
url="https://github.com/josephcrowell/${pkgname}"
license=('LGPL-2.0-or-later')
depends=(
  qt6-base
  qt6-svg
  qt6-webengine
)
makedepends=(cmake clang qt6-tools git)
source=("git+${url}.git#commit=${pkgver}")

build() {
  cd "${srcdir}/${pkgname}"

  mkdir build && cd build

  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

sha256sums=('b5b2d5bbac6dd9c887093a13c2a95ea996485bca1aa9201308873e0f8042ee50')
