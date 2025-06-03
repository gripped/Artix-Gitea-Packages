# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mm-common
pkgver=1.0.6
pkgrel=2
pkgdesc="Common build files of the C++ bindings"
url="https://www.gtkmm.org/"
arch=(any)
license=(GPL-2.0-or-later)
depends=(
  bash
  doxygen
  graphviz
  gtk-doc
  libsigc++-docs
  perl-xml-parser
  python
)
makedepends=(
  git
  libsigc++
  meson
)
source=(
  "git+https://gitlab.gnome.org/GNOME/mm-common.git#tag=$pkgver"
  https://gcc.gnu.org/onlinedocs/libstdc++/latest-doxygen/libstdc++.tag
)
b2sums=('e3e6857edcb7a03b3a959a9dfba381b0cd77c06231a1cdd3784f42888e6494321db8a6378c797e87e95a90dcde1350e4c5b3616b91e4d9f02fdddab9b56c4091'
        'SKIP')

prepare() {
  cd $pkgname
  cp ../libstdc++.tag doctags
}

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
