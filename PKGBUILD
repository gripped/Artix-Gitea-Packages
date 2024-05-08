# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=geoclue
pkgver=2.7.1
pkgrel=3
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
source=(
  "git+https://gitlab.freedesktop.org/geoclue/geoclue.git#tag=$pkgver"
  0001-WIP-Use-Google-Maps-Platform-by-default.patch
)
b2sums=('0e8ab05d8124598d9bd306bb2f81a9c4e47c02b710265048e19d950d8587e3ff729234b2e07847c3f0b9118c7b89153f9e59b6414a6660007203e7a831ce839b'
        '192e35693aa8145ac3ad23ee0fb64a247298e57959095281614cc33be27e60ad7ce16117df043ab7bff9ca721cce3e82cea0bfaddb9c5996b24be7cb4ebd95ce')



prepare() {
  cd geoclue

  # Use Google Maps Platform as the default geolocation service
  # https://gitlab.archlinux.org/archlinux/packaging/packages/geoclue/-/issues/1
  git apply -3 ../0001-WIP-Use-Google-Maps-Platform-by-default.patch
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
