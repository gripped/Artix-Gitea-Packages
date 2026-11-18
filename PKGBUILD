# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Adam Hani Schakaki <adam@schakaki.net>
# Contributor: Ner0

pkgname=muffin
pkgver=6.8.4
pkgrel=1
pkgdesc='Cinnamon window manager based on Mutter'
arch=(x86_64)
url='https://github.com/linuxmint/muffin'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  cinnamon-desktop
  cinnamon-settings-daemon
  dconf
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gtk3
  json-glib
  libcanberra
  libdrm
  libgcc
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  python
  startup-notification
  systemd-libs
  wayland
  xenity
  xorg-xwayland
)
makedepends=(
  egl-wayland
  git
  glib2-devel
  gobject-introspection
  meson
  wayland-protocols
)
source=("git+https://github.com/linuxmint/muffin.git#tag=$pkgver")
b2sums=(e97d05dc9cbd51e5b4034d4a7039ee34d3a56e9a3b5a65a9a2d301b1e4b93b4a9f8c2ad6289d10c9a57171be7188909a72d8dc216f504b6f442161b76924fd2b)

build() {
  artix-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
