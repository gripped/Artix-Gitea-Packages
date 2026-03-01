# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.9.4
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(
  cairo
  glib2
  glibc
  libinput
  libpng
  librsvg
  libsfdo
  libwlroots-0.19.so
  libxcb
  libxkbcommon
  libxml2
  pango
  pixman
  seatd
  ttf-font
  wayland
  xorg-xwayland
)
makedepends=(
  git
  meson
  scdoc
  wayland-protocols
)
optdepends=("bemenu: default launcher via Alt+F3")
source=("git+https://github.com/labwc/labwc#tag=${pkgver}")
b2sums=('78316f7002fabbb8b16b5fd5ad6504b2c4d1f072cf28b6699ede4f6e67e8aba4df86107207215a5c4b144f7ee6cba18d58c9947dd3be749dc7ec997a38e73aae')


build() {
  artix-meson -Dman-pages=enabled "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
