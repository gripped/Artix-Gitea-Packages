# Maintainer: commandk <commandk@artix>

pkgname=radicle-artifact
_commit=ab598682e255465b59c757e23aa3df6ad02f6719
pkgver=0.23.3
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
sha512sums=('fe1a8a405f94e9d4b621ef3a9c6fb26ae863c3c8360855e6791653939ecd397d114fa0f7d195466b67a3559c36fcdd183617828b39e284bf2b03853107a10dcd')

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
