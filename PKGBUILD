# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-applets
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='Applets for COSMIC Panel'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-applets
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  dbus
  libgcc
  glibc
  libinput
  libpipewire
  libpulse
  libxkbcommon
  libelogind
  util-linux
)
makedepends=(
  cargo
  clang
  git
  just
  mold
)
source=(git+https://github.com/pop-os/cosmic-applets.git#tag=epoch-${pkgver})
b2sums=('3a5593504fbdfa09b98e7f18a99abdc0705cad63a025c5394761cf7994b58e15119d9ce6cb633ea1544afdf264dec2f75652b8f3877f7080fe77d6f00eb614a0')

prepare() {
  cd cosmic-applets
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-applets
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-applets
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
