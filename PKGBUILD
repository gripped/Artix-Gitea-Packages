# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=51rc
pkgrel=1
pkgdesc="Find places around the world"
url="https://apps.gnome.org/Maps"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  geoclue
  geocode-glib-2
  gjs
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  libgcc
  libgweather-4
  libportal
  librest
  librsvg
  libshumate
  libxml2
  pango
  sqlite
)
makedepends=(
  blueprint-compiler
  git
  gobject-introspection
  meson
  yelp-tools
)
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-maps.git?signed#tag=${pkgver/[a-z]/.&}"
)
b2sums=('3c35f465d89e6fc0fb3aa1cb3fc69f86de08aaa5d073daf62eff8d281243319ac49399fa7b5fedb038fa23c34f41f2523a6ac6bed0a8fb493d06bff2bf2e8b17')
validpgpkeys=(
  7448F128A4B18AB2EF87F092FA6624580A420D5D # Marcus Lundblad <ml@update.uu.se>
)

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
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
