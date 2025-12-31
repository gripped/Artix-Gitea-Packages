# Maintainer: artist for Artix Linux

_module='dictionary'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=5
pkgdesc="Launcher Dictionary Frontend, use 'd  ' as trigger."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha' 'sdcv')
makedepends=('git' 'meson>=0.58.0' cmake moksha efl)
source=("${_module}::git+https://github.com/thewaiter/launcher-${_module}.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_module"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir/$_module"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

