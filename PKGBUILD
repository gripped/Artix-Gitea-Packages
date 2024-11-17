# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.8.1
pkgrel=1
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'libwlroots-0.18.so' 'wayland' 'xorg-xwayland' 'libsfdo' )
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
conflicts=(labwc)
provides=(labwc wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8e510655cf0c84875c541f4afeb636e707d365210993ad22d64d8bc3108a3433')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

