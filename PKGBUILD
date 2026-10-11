# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-nibbles
pkgver=4.6.1
pkgrel=1
pkgdesc="Guide a worm around a maze"
url="https://wiki.gnome.org/Apps/Nibbles"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  glibc
  glibmm-2.68
  gsound
  gtk4
  gtkmm-4.0
  hicolor-icon-theme
  libgcc
  libsigc++-3.0
  libstdc++
  pango
  pangomm-2.48
)
makedepends=(
  appstream
  git
  gobject-introspection
  meson
  yelp-tools
)
groups=(gnome-extra)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-nibbles.git?signed#tag=$pkgver"
)
b2sums=('1d73b379c07923967b0b0a7b359acca42aac9dd81eec1ea698809528dde63503e8111d2ee89778b4f1b4a3f1fb5e910b68368d98387cbae5544d6162c162f1f5')
validpgpkeys=(
  31F449AE968CBE194119A3AD1F1DC770CE79E68B # Ben Corby <bcorby@new-ms.com> (old)
  9CE6D700965C6A1D6F7B4A1C18B04BB8340E3EC5 # Ben Corby <bcorby@new-ms.com>
)

prepare() {
  cd $pkgname
}

build() {
  # Suppress a lot of unimportant warnings
  CFLAGS+=" -Wno-unused"

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
