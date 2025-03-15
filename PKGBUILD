# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgbase=libmanette
pkgname=(
  libmanette
  libmanette-docs
)
pkgver=0.2.11
pkgrel=1
pkgdesc="Simple GObject game controller library"
url="https://gnome.pages.gitlab.gnome.org/libmanette/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  hidapi
  libevdev
  libgudev
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  vala
)
source=("git+https://gitlab.gnome.org/GNOME/libmanette.git#tag=$pkgver")
b2sums=('52429dabe15fef2a4d33fbe819ad4b1794d75bc545291eee6abc3ecc2caffc694771bac81bd0768e75ebdbd7a61fb89214b596ecb2298ad89931e8647f68a1bc')

prepare() {
  cd $pkgname

  # Needs gobject-introspection 1.84.0
  git revert -n 60f4692161adc40a5a9be7cdeab4d81129aa9705
}

build() {
  artix-meson $pkgname build -D doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libmanette() {
  provides=(libmanette-0.2.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libmanette-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
