# Maintainer: commandk <commandk@artix>

pkgname=radicle-artifact
_commit=65878e72a2fb4a9bbbbf33bbb93838499075ccc1
pkgver=0.22.0
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
sha512sums=('7933e76e29544ef2a26db17d3d7e33b99b21fc325618b094338a4fcaaafb586df082e6a55a04952f4e65e1b8ec823f37cbe7bf93a7ff51e26fd0406efbfb5094')

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
