# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.7.1
pkgrel=1
pkgdesc="Window Manager designed for speed, usability, and consistency"
url="https://ice-wm.org/"
arch=('x86_64')
license=('LGPL-2.0-only')
depends=('alsa-lib' 'imlib2' 'librsvg' 'libsndfile' 'libxcomposite' 'libxdamage' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('asciidoctor' 'xorg-mkfontscale')
optdepends=('perl: for icewm-menu-xrandr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ice-wm/icewm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e01b2c9740459281107c20ebe70c4c73c383b1e8ada85980ff07e85517e4138f')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
