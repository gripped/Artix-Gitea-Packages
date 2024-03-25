# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=46.0
pkgrel=1
pkgdesc="A simple GNOME 3 maps application"
url="https://wiki.gnome.org/Apps/Maps"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  hicolor-icon-theme
  gcc-libs
  geoclue
  geocode-glib-2
  gjs
  glib2
  glibc
  gtk4
  json-glib
  libadwaita
  libgweather-4
  libportal
  librest
  librsvg
  libshumate
  libxml2
  pango
)
makedepends=(
  git
  gobject-introspection
  meson
  yelp-tools
)
groups=(gnome)
_commit=8333905cec2c980fcc4fc9aabded80ecec4c776e  # tags/v46.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-maps.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -r 's/^v//;s/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  artix-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
