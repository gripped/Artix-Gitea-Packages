# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=45.4
pkgrel=1
pkgdesc="A simple GNOME 3 maps application"
url="https://wiki.gnome.org/Apps/Maps"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  hicolor-icon-theme
  geoclue
  geocode-glib-2
  gjs
  glib2
  gtk4
  libadwaita
  libgweather-4
  libportal
  librest
  libshumate
  libxml2
)
makedepends=(
  git
  gobject-introspection
  meson
  yelp-tools
)
groups=(gnome)
_commit=dd776033d1905d5e68a9192361e605ea782d34b3  # tags/v45.4^0
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
