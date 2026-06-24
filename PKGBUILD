# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='COSMIC session service which applies backgrounds to displays'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-bg
license=(MPL-2.0)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
)
makedepends=(
  clang
  cargo
  git
  just
  lld
  nasm
)
source=(
  git+https://github.com/pop-os/cosmic-bg.git#tag=epoch-${pkgver}
)
b2sums=('8f9eb2af96b5ef26c2565062874a4f1116b2db152e7ce0d14008fdc0ecdadd39f0b70f11515a39ec9e1cc1a3f5b62ad4e1c92bb7561b7ba1e438a64e49bc8757')

prepare() {
  cd cosmic-bg
  cargo fetch --locked
}

build() {
  cd cosmic-bg
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-bg
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
