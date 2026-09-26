# Maintainer: commandk <commandk@artix>

pkgname=radicle-artifact
_commit=3010f3da67668ec3b6e5a423a00d17b6e653e4be
pkgver=0.20.0
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
sha512sums=('e0382a82bc5b97c46decc387297736016f1a4bd2e3a34836b422301de94ead0325973ece53007cd628caa6bbee8ebb4885dd62548632533a3f9b81dbcc525674')

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
