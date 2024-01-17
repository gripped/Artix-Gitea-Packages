# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=geoclue
pkgver=2.7.1
pkgrel=2
pkgdesc="Modular geoinformation service built on the D-Bus messaging system"
url="https://gitlab.freedesktop.org/geoclue/geoclue/-/wikis/home"
arch=(x86_64)
license=(
  LGPL-2.1-or-later
  GPL-2.0-or-later
)
depends=(
  avahi
  json-glib
  libmm-glib
  libsoup3
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  libnotify
  meson
  udev
  vala
)
optdepends=('libnotify: Demo Agent')
provides=("geoclue2=$pkgver-$pkgrel")
conflicts=(geoclue2)
replaces=(geoclue2)
backup=(etc/geoclue/geoclue.conf)
_commit=8a24f60969d4c235d9918796c38a6a9c42e10131  # tags/2.7.1
source=("git+https://gitlab.freedesktop.org/geoclue/geoclue.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd geoclue
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd geoclue
}

build() {
  local meson_options=(
    -D dbus-srv-user=geoclue
    -D dbus-sys-dir=/usr/share/dbus-1/system.d
  )

  artix-meson geoclue build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  echo 'u geoclue - "Geoinformation service" /var/lib/geoclue' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/geoclue.conf"

  echo 'd /var/lib/geoclue 0755 geoclue geoclue' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/geoclue.conf"
}

# vim:set sw=2 sts=-1 et:
