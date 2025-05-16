# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=totem
pkgver=43.1+r44+gbf65cd39c
pkgrel=1
pkgdesc="Movie player for the GNOME desktop based on GStreamer"
url="https://apps.gnome.org/Totem/"
arch=(x86_64)
license=('GPL-2.0-or-later WITH GStreamer-exception-2008')
depends=(
  at-spi2-core
  cairo
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  grilo
  gsettings-desktop-schemas
  gst-plugin-gtk
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gstreamer
  gtk3
  hicolor-icon-theme
  iso-codes
  libepoxy
  libgirepository
  libhandy
  libpeas
  libportal
  libportal-gtk3
  pango
  python
  python-gobject
  totem-plparser
)
makedepends=(
  appstream-glib
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  yelp-tools
)
checkdepends=(xorg-server-xvfb)
optdepends=(
  'gst-plugins-ugly: Extra media codecs'
  'gst-libav: Extra media codecs'
  'grilo-plugins: Media discovery'
)
provides=(libtotem.so)
conflicts=(totem-plugin)
replaces=(totem-plugin)
groups=(gnome)
_commit=bf65cd39c892608c6dc0286f907c3adfb6807770  # gnome-43
source=(
  "git+https://gitlab.gnome.org/GNOME/totem.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgd.git"
)
b2sums=('1f28b9ca5f2cc892133a8d8dd87cc89b0151bcd86152f4fa9fdf68dec8cec11a4ca8a95266a7ebe74f8c340b22d97b800927a96607653d52fcc95ac2d8212e55'
        'SKIP')

pkgver() {
  cd totem
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd totem

  git submodule init subprojects/libgd # Skip flatpak/shared-modules
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D enable-gtk-doc=true
  )

  artix-meson totem build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 totem/COPYING
}

# vim:set sw=2 sts=-1 et:
