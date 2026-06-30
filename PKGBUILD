# Maintainer: capezotte <capezotte@artixlinux.org>
# Based-on: gnome-session by Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=gnome-session-sysvinit
pkgver=50.0.20260410
pkgrel=2
pkgdesc="Init agnostic GNOME session handler from Porteus"
url="https://github.com/fulalas/gnome-session-sysvinit/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  bash
  libgcc
  elogind
  glib2
)
makedepends=(
  git
  meson
)
conflicts=(
  gnome-session-leader
  # needs two modes
  gdm
)
replaces=()
provides=(gnome-session-leader)
source=("git+https://github.com/capezotte/gnome-session-sysvinit#branch=standalone")
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
}

build() {
  local meson_options=()

  artix-meson "$pkgname" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
