# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-comp
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='Compositor for the COSMIC desktop environment'
arch=(x86_64)
url='https://github.com/pop-os/cosmic-comp'
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  fontconfig
  libgcc
  glibc
  libdisplay-info
  libseat.so
  libinput
  libxcb
  libxkbcommon
  mesa
  pixman
  libelogind
  wayland
)
makedepends=(
  cargo
  git
  lld
)
source=(git+https://github.com/pop-os/cosmic-comp.git#tag=epoch-${pkgver})
b2sums=('f80dd3547a4ec9e8e5e9a8ad849156077276a8a89eb4aa50fbcfd8ae23d34e2b492f4b466c1dca8f0a0ef815a43897038f7e9787ffe10cac0d4ff1d6122f27b4')

prepare() {
  cd cosmic-comp

  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-comp
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release"
}

package() {
  cd cosmic-comp
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
