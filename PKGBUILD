# Maintainer: artist for Artix Linux

pkgname=elementary-icon-theme
pkgver=8.0.0
pkgrel=1.2
pkgdesc='Named, vector icons for elementary OS'
arch=(any)
url=https://github.com/elementary/icons
license=(GPL3)
depends=(hicolor-icon-theme)
makedepends=(
  git
  librsvg
  meson
  xorg-xcursorgen
)
source=($pkgname::git+https://github.com/elementary/icons.git)
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build \
    -Dvolume_icons=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

