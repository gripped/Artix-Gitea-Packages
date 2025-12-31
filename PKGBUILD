# Maintainer: artist for Artix Linux

_module='diskio'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=7
pkgdesc="Visualize disk i/o."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git' 'meson>=0.58.0')
source=("${_group}::git+https://github.com/JeffHoogland/${_group}.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_group/modules/$_module"
  meson setup --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir/$_group/modules/$_module"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

