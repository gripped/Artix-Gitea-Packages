# Maintainer: artist for Artix Linux

pkgname=labwc
pkgver=0.9.0
pkgrel=1
pkgdesc='wlroots-based window-stacking compositor for wayland'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(cairo glib2 glibc libinput libpng librsvg libsfdo libwlroots-0.18.so
         libxcb libxkbcommon libxml2 pango pixman ttf-font wayland xorg-xwayland)
makedepends=('meson' 'cmake' 'scdoc' 'wayland-protocols')
provides=(wayland-compositor)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d06f89fb2bbd4be73e7bba9fb57017054d61868fe24db361d1ded87470329e63')

build() {
  artix-meson -Dman-pages=enabled "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

