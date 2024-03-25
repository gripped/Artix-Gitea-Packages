# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gjs
pkgver=1.80.1
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
  js115
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
_commit=7d6c340f566379fadb582bd2082f214e23603f73  # tags/1.80.1^0
source=("git+https://gitlab.gnome.org/GNOME/gjs.git#commit=$_commit")
b2sums=('ba2a35b1d71fe6561b67564c66e8569bed953ae2d4e87decc6183ff64d6e8144e6c80734cb88addc7b111d2fac340a6f1c131a27d019dd32caafed65e84fb14e')

pkgver() {
  cd gjs
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gjs
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
    meson test -C build --print-errorlogs
}

package() {
  depends+=(libreadline.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
