# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=1.13.4
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=(
  git
  meson
  libcap
  linux-api-headers
  gtk-update-icon-cache
  desktop-file-utils
)
depends=(
  libstdc++
  libgcc
  glibc
  dbus
  gpu-screen-recorder
  gpu-screen-recorder-notification
  libglvnd
  libx11
  libxkbcommon
  libxrandr
  libxrender
  libxcomposite
  libxfixes
  libxext
  libxi
  libxcursor
  libpulse
  libdrm
  wayland
  pango
  freetype2
  glib2
)

source=(git+https://repo.dec05eba.com/gpu-screen-recorder-ui#tag=${pkgver})
sha512sums=('4a8ee240b40a7382e009277199fde7fa3f01c12e37e209e3aa9c53eb46668a2bbd1e51b59a7f5d04438a4136144ba42571b718558dab6a440240765abb26bd2b')
install="${pkgname}.install"

build() {
  cd "$srcdir"/$pkgname
  artix-meson build --buildtype=release -Dstrip=true
  meson compile -C build
}

package() {
  cd "$srcdir"/$pkgname
  meson install -C build --destdir "$pkgdir"
}
