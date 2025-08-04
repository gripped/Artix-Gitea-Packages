# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=48.6
pkgrel=1
pkgdesc="Find places around the world"
url="https://apps.gnome.org/Maps"
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
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-maps.git?signed#tag=${pkgver/[a-z]/.&}"
)
b2sums=('4443238cb48c2c6c50f61eec3e8c319d97c9aad74ca5e99171c0f8ce860ae37480090c66e3e3dcf5fc9b2bb51b8571a4a8d9fe8d6d81932ee2558680366b897b')
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
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
