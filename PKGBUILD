# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=geoclue
pkgver=2.7.2
pkgrel=1
pkgdesc="Modular geoinformation service built on the D-Bus messaging system"
url="https://gitlab.freedesktop.org/geoclue/geoclue/-/wikis/home"
arch=(x86_64)
license=(
  LGPL-2.1-or-later
  GPL-2.0-or-later
)
depends=(
  avahi
  gcc-libs
  glib2
  glibc
  json-glib
  libmm-glib
  libsoup3
)
makedepends=(
  git
  glib2-devel
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
source=(
  "git+https://gitlab.freedesktop.org/geoclue/geoclue.git#tag=$pkgver"
)
b2sums=('e77c32743762d346e4decdf4893a9299db56f9ef98f7b17633464788ec04dda2d2cfe740192bfbce67acc2e207943ee1af6c723214d8d850cd849e380867e126')


prepare() {
  cd geoclue
}

build() {
  local meson_options=(
    -D dbus-sys-dir=/usr/share/dbus-1/system.d
    -D dbus-srv-user=geoclue
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
