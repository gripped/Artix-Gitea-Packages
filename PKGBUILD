# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=xviewer
pkgver=3.4.19
pkgrel=1
pkgdesc='Simple image viewer'
arch=(x86_64)
url='https://github.com/linuxmint/xviewer'
license=(GPL-2.0-or-later)
groups=(x-apps)
depends=(
  at-spi2-core
  cairo
  cinnamon-desktop
  dconf
  exempi
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  lcms2
  libexif
  libjpeg-turbo
  libpeas
  librsvg
  libx11
  xapp
  zlib
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  itstool
  meson
)
optdepends=('xviewer-plugins: Additional features')
source=("git+https://github.com/linuxmint/xviewer.git#tag=$pkgver")
b2sums=(ff683a376d65728c61edf338af6c63d521df07313c2fc25d39f4406a59618aa7637f80077ab28f80d627b2a4f1387593a7982d3ac2e315d84298f197b25b41c8)

prepare() {
  cd $pkgname
}

build() {
  artix-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
