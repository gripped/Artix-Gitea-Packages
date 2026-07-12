# Maintainer: commandk <commandk@artix>

pkgname=radicle-artifact
_commit=cce01a3e526a021b6cda679d44b4e044eee7334c
pkgver=0.17.0
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
sha512sums=('1fada73d31556a98f32f4197fce390683f68bda98b58a074c0eaac907ed809326d05685723464c89f37df2cac044c421fe94cf724a57eb367057cae18b2ca9ea')

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
