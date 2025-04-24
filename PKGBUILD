# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=48.2
pkgrel=2
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
b2sums=('2bcc5659cfdd68eaa268542f91f28b29e813a39f294dfa9dadeaa63e9d2f92ea45e57d8971adad2b791d0d967ed1d7f83c6facf4a4371317922f643df382813c')
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
