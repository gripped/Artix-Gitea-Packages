# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='The settings application for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-settings
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  accountsservice
  adw-gtk-theme
  cosmic-icon-theme
  cosmic-randr
  fontconfig
  libgcc
  glibc
  iso-codes
  libinput
  libpipewire
  libpulse
  libxkbcommon
  networkmanager
  nm-connection-editor
  pipewire-pulse
  libelogind
  ttf-opensans
  wayland
)
makedepends=(
  cargo
  clang
  git
  just
  mold
)
optdepends=('power-profiles-daemon: power profiles support')
source=(git+https://github.com/pop-os/cosmic-settings.git#tag=epoch-${pkgver})
b2sums=('eed9bd9c7197893b987f5163523cf095890c782578becd840a859442923c538f686c37bab864e5af85722fcc933d175632a7e3fba5a41eb864fab04c5cf5c2d2')

prepare() {
  cd cosmic-settings
  cargo fetch --locked
}

build() {
  cd cosmic-settings
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-settings
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
