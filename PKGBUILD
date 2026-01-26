# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=webappcontainer
pkgver=1.4.2
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
source=("git+${url}.git#tag=${pkgver}")

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

sha256sums=('838775e35484d9873955336cf2a15b170baff0b0a8a57896067f98a887b76bfa')
