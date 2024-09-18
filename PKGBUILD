# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Igor Dyatlov <dyatlov.igor@gmail.com>

pkgname=gnome-console
pkgver=47.0
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
url="https://gitlab.gnome.org/GNOME/console"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  gcc-libs
  gtk4
  glib2
  glibc
  hicolor-icon-theme
  libadwaita
  libgtop
  pango
  vte4
)
makedepends=(
  appstream
  git
  glib2-devel
  meson
)
groups=(gnome)
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/console.git#tag=${pkgver/[a-z]/.&}")
b2sums=('cceec462135a72c11c4daa094bfcc04c7c7c55fe46f75180d4a0d5b9dc66cba6c71e3977e237fe1fbbff7a33acc50a1dc87be528fc939c8e710540d4f3ce43c0')

prepare() {
  cd $pkgname
}

build() {
  local meson_options=(
    -D tests=true
  )

  artix-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
