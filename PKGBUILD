# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.8.4
pkgrel=2
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'wlroots=0.18.2' 'wayland' 'xorg-xwayland' 'libsfdo' )
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
provides=(wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2d3ded90f78efb5060f7057ea802c78a79dc9b2e82ae7a2ad902af957b8b9797')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

