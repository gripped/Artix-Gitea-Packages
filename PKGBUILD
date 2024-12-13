# Maintainer: artist for Artix Linux

_module='engage'
pkgname="moksha-module-${_module}"
pkgver=0.1.2
pkgrel=8.1
pkgdesc="A dock that holds a taskbar and application launcher. Add instances with: Config Panel > Extensions > Engage"
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git' 'meson>=0.58.0' cmake moksha efl)
source=("${_group}::git+https://github.com/JeffHoogland/${_group}.git")
sha256sums=('SKIP')
options=(!strip)   # Required!

build() {
  cd "${srcdir}/${_group}/modules/${_module}"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "${srcdir}/${_group}/modules/${_module}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

