# Maintainer: commandk <commandk@artix>

pkgname=radicle-artifact
_commit=ed79ebbb8bc711243cc203a8faf6db5f0987601b
pkgver=0.23.0
pkgrel=1
pkgdesc="Secure artifact distribution for Radicle"
url="https://radicle.network/nodes/iris.radicle.network/rad:z4VYyJ9KuwMNkXGQnmKuGPGKw3inv"
arch=('x86_64')
license=('Apache-2.0 OR MIT')
depends=(
  'glibc'
  'libgcc' 'libgcc_s.so'
  #'libgit2' 'libgit2.so'
)
makedepends=(
  'git'
  'cargo'
)
source=(
  #"radicle-artifact::git+https://iris.radicle.network/z4VYyJ9KuwMNkXGQnmKuGPGKw3inv.git#tag=releases/${pkgver}"
  "radicle-artifact::git+https://iris.radicle.network/z4VYyJ9KuwMNkXGQnmKuGPGKw3inv.git#commit=${_commit}"
)
sha512sums=('955885bb2ed660ca86cf67a6d1e298284008144c7cc6adfd7a906501a47753aac36ec1bc37a5727603f77327458afdab6dae30a8dc7a8903fc2e95fa84ec174d')

prepare() {
  cd "${pkgname}"
  #patch -p1 < ../001-no-zig-build.patch
}

build() {
  cd "${pkgname}"

  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export LIBGIT2_NO_VENDOR=1
  export CARGO_PKG_VERSION="${pkgver}"

  cargo build \
    -p radicle-artifact \
    -p radicle-artifact-node \
    --release \
    --locked \
    --bins
}

package() {
  cd "radicle-artifact"

  install -Dm755 \
    target/release/rad-artifact \
    target/release/rad-artifact-node \
    -t "${pkgdir}/usr/bin"

    # Readme (License)
  install -Dm644 \
    README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
