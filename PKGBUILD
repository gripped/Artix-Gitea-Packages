# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-calculator
pkgver=48.0
pkgrel=1
pkgdesc="GNOME Scientific calculator"
url="https://apps.gnome.org/Calculator"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  glibc
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libgee
  libmpc
  libsoup3
  libxml2
  mpfr
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
provides=(
  libgcalc-2.so
  libgci-1.so
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-calculator.git#tag=${pkgver/[a-z]/.&}")
b2sums=('8c740d45e755e71023dc88a7abb5007af9a81ccb8de425a63a15d70ac04b81141b4e6864218ae6cb11e63f14af873adad9f808de9f109883c49f2a7639ec4391')

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
