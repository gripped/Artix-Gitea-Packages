# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=3.0.0
pkgrel=2
pkgdesc='A Modern Linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(MIT)
depends=(
  glibc
  libgcc
  zlib
)
makedepends=(
  git
  rust
)
options=(!lto)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('70c1bd175355665242abbfedba14ac85ffe8f9d03ae77bff488cfb73175f75d3458e3dae0ce4f6f25ec7618f8ef8599b598138c606802adedd7b02ce953c0b3f')
b2sums=('ef8d5860d6175085492b4af3edc5058cf23ae3ffe6634fd0232876e838333e09a8e0c47746950d8ecf555e838f987263e291b9825c6eca2a64f9df0e2a56c76a')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --package mold-cli
}

check() {
  cd "$pkgname"

  cargo test --frozen
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" PREFIX=/usr ./install-mold.sh

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
