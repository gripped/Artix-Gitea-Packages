# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor
pkgver=51.0
pkgrel=1
pkgdesc="View current processes and monitor system state"
url="https://apps.gnome.org/SystemMonitor"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  glibmm-2.68
  graphene
  gtk4
  gtkmm-4.0
  hicolor-icon-theme
  libadwaita
  libgcc
  libgtop
  librsvg
  libsigc++-3.0
  libstdc++
  pango
  polkit
)
makedepends=(
  appstream
  catch2
  git
  glib2-devel
  meson
  yelp-tools
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-system-monitor.git#tag=${pkgver/[a-z]/.&}")
b2sums=('fc6c5bdd8282bdceb330b655935cfb2ad9cd80fe80a98dcf51ad8bf9fea9cc3a11749c43ad5ed271ae307d68fc05db7bcb6cad85b6f895b6bcb1e393f37dab9b')

prepare() {
  cd $pkgname
}

build() {
  artix-meson $pkgname build -Dsystemd=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
