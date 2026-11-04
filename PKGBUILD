# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gthumb
pkgver=4.0.1
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop"
url="https://wiki.gnome.org/Apps/Gthumb"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  exiv2
  gdk-pixbuf2
  giflib
  glib2
  glibc
  graphene
  gsettings-desktop-schemas
  gst-plugin-gtk4 # for gtk4paintablesink
  gst-plugins-bad-libs # for scaletempo
  gst-plugins-base-libs # for glsinkbin, playbin
  gst-plugins-good # for autovideoflip, videoflip
  gstreamer
  gtk4
  hicolor-icon-theme
  lcms2
  libadwaita
  libcolord
  libgcc
  libheif
  libjpeg-turbo
  libjxl
  libpng
  libportal
  libportal-gtk4
  libraw
  librsvg
  libstdc++
  libtiff
  libwebp
  pango
  zlib
)
makedepends=(
  appstream
  git
  glib2-devel
  meson
  vala
  yelp-tools
)
source=(
  "git+https://gitlab.gnome.org/GNOME/gthumb.git#tag=$pkgver"
)
b2sums=('0501e789d84d6eb47fbd2145c8ce735be38c302d4c0e10a7e7d745cde0687b2a7fad95b0a09f8413074b538a86b6452bd2cda7d9f14d0e61426d6b92533a14c7')

prepare() {
  cd gthumb
}

build() {
  artix-meson gthumb build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
