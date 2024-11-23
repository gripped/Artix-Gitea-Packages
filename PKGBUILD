# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-maps
pkgver=47.2
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
  "git+https://gitlab.gnome.org/GNOME/gnome-maps.git?signed#tag=v${pkgver/[a-z]/.&}"
)
b2sums=('3f1430c3de89abec1dc641ae63996a16fdbe7000fd92d3d82910713f95f7b592e2a61e02812726e194661b19ba470ca7c2a97f9840e70fffada62dc82837681d')
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
