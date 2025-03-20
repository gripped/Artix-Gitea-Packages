# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gjs
pkgver=1.84.1
pkgrel=1
epoch=2
pkgdesc="Javascript Bindings for GNOME"
url="https://wiki.gnome.org/Projects/Gjs"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  cairo
  dconf
  gcc-libs
  glib2
  glibc
  gobject-introspection-runtime
  js128
  libffi
  libgirepository
  libsysprof-capture
  libx11
  readline
)
makedepends=(
  dbus
  git
  gobject-introspection
  meson
)
checkdepends=(
  gtk3
  gtk4
  xorg-server-xvfb
)
provides=(libgjs.so)
source=("git+https://gitlab.gnome.org/GNOME/gjs.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git")
b2sums=('2a0400dff36b2bdb746aa9cc9feeb5b69ee7c2ebb3108d07b01335fc0e281a98f25d2173fca5dd0b4a2c1839d3f1fcd26b3e6c37b17fb7bbda74685ad7ab8b56'
        'SKIP')
validpgpkeys=(
  53C0524AD3AE115F69C47D2D0E9D857756977391 # Philip Chimento (Signing Key for GNOME Releases) <philip.chimento@gmail.com>
)

prepare() {
  cd gjs

  git submodule init
  git submodule set-url subprojects/gobject-introspection-tests "${srcdir}/gobject-introspection-tests"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D installed_tests=false
  )

  artix-meson gjs build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs ||:
}

package() {
  depends+=(libreadline.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
