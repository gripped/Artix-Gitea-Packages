# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.8.2
pkgrel=2
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'wlroots=0.18.2' 'wayland' 'xorg-xwayland' 'libsfdo' )
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
provides=(wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1adba1c87ec26f2f00409b47a0b79ccfd68bd160e1abc41822fb01f0a76ee947')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

