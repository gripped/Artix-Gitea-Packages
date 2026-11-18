# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo
pkgver=6.8.4
pkgrel=2
pkgdesc='File manager for Cinnamon (Nautilus fork)'
arch=(x86_64)
url='https://github.com/linuxmint/nemo'
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  at-spi2-core
  bash
  cairo
  cinnamon-desktop
  dconf
  exempi
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  gtk-layer-shell
  gtk3
  gvfs
  hicolor-icon-theme
  json-glib
  libexif
  libgcc
  libx11
  libxmlb
  pango
  python
  python-cairo
  python-gobject
  wayland
  xapp
)
optdepends=(
  'catdoc: search helpers support for legacy MS Word files'
  'cinnamon-translations: i18n'
  'ffmpegthumbnailer: support for video thumbnails'
  'ghostscript: search helpers support for PostScript files'
  'libgsf: search helpers support for MS Office files'
  'libreoffice: search helpers support for legacy MS PowerPoint files'
  'poppler: search helpers support for PDF files'
  'python-xlrd: search helpers support for legacy MS Excel files'
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool json-glib
  libgsf
  meson
)
source=("git+https://github.com/linuxmint/nemo.git#tag=$pkgver")
b2sums=(127b8684d2ec04c33d269c73af7f6b9810283ca7d6469179fa54f8a6a321b2758cd8841be21d71a6c757a56390acb81dc745cec54c20d947428ac6b5c58ee127)

build() {
  artix-meson $pkgname build \
    --libexecdir=lib/$pkgname \
    -D gtk_doc=true \
    -D gtk_layer_shell=true
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
