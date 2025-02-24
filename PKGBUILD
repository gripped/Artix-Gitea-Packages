# Maintainer: artist for Artix Linux

_module='wincontrol'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=7
pkgdesc="Gadget for controlling window actions."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git' 'meson>=0.58.0')
source=("${_module}::git+https://github.com/thewaiter/${_module}.git")
sha256sums=('SKIP')
build() {
  export LDFLAGS=-Wl,--allow-multiple-definition
  export CFLAGS="-mtune=generic -O2 -pipe -fno-plt -fexceptions \
         -Wp,-D_FORTIFY_SOURCE=2 -Wno-format -Wno-format-security  \
         -fstack-clash-protection -fcf-protection"
  cd "${srcdir}/${_module}"
  meson setup --prefix=/usr . build
  meson configure build
  ninja -C build
}
package() {
  cd "${srcdir}/${_module}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

