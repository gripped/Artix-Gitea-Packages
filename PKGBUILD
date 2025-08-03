# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.9.1
pkgrel=1
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(cairo glib2 glibc libinput libpng librsvg libsfdo libwlroots-0.19.so
         libxcb libxkbcommon libxml2 pango pixman ttf-font wayland xorg-xwayland)
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
provides=(wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bf7a245d5fc5665329b3f5c9cb589eb33e658b8eb638cf4f4c9ad68f4b5979f0')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

