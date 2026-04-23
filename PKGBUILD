# Maintainer: arc-d3v <arc-d3v@artixlinux.org>
# Contributor: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=1.11.5
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
sha512sums=('4136b728012ce328e79625ee68e03951b3ca6b6a1ae2269b56c1c30027cbaaf968de477e43e35e43b805173ce6962b46f2551b5968c7cef5905a043f6f54fc37')
install="${pkgname}.install"

build() {
  cd "$srcdir"/$pkgname
  arch-meson build --buildtype=release -Dstrip=true
  meson compile -C build
}

package() {
  cd "$srcdir"/$pkgname
  meson install -C build --destdir "$pkgdir"
}
