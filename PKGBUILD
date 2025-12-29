# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-input-libinput
pkgver=25.0.0
pkgrel=6
pkgdesc="XLibre fork of the generic input driver for the X.Org server based on libinput"
arch=('x86_64')
license=('MIT')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')
depends+=('libinput')
makedepends+=('libxi' 'libx11' 'libxfont2' 'meson>=0.50.0')
install=$pkgname.install

build() {
  arch-meson ${_pkgname}-xlibre-${_pkgname}-${pkgver} build \
    -D xorg-conf-dir=/usr/share/X11/xorg.conf.d/ 

  meson configure build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

sha256sums=('aa7369a0a3834876ba11659cc663105a1511651d7ac2be2338e5d195283fbd00')
