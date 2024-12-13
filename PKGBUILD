# Maintainer: artist for Artix Linux

_module='stickynotes'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=8
pkgdesc="Sticky Notes module for the E/Moksha desktop"
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git' 'meson>=0.58.0' cmake moksha efl)
source=("${_module}::git+https://github.com/thewaiter/StickyNotes.git")
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
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

