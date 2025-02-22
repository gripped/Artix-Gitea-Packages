# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.8.3
pkgrel=1
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'wlroots=0.18.2' 'wayland' 'xorg-xwayland' 'libsfdo' )
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
provides=(wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('746be2ff2d0c0c0b795c97fa24c7058f75586685c88a1194c243b6a846f938a5')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

