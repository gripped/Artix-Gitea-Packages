# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=bear
pkgver=4.1.1
pkgrel=2
pkgdesc='A tool to generate compilation database for clang tooling'
arch=(x86_64)
url='https://github.com/rizsotto/Bear'
license=(GPL-3.0-or-later)
depends=(
  sh
  glibc
  libgcc
)
makedepends=(
  git
  rust
)
options=(!lto)
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  avoid-libexec.patch
)
sha512sums=('c60f917d57e1f3fea720f73b062759a932617b4c6a660de9f067567ef9d737ebdf8178712a7f13a906dc01a16bc5af553fc0f7b8168a7dd43b700fd003c40051'
            '1ce060b89a48502be9c688d4cdf5668649bf56f573d4c789004c9dc881b31073c38d8941131c360a1c26d306ae502cf037112bd31a9f74af01a7d2971346fb50')
b2sums=('85ea6b0a1e039b9c69e3585a55582ac999632d368f9254e401964d35227dc3f37208f4728848a8375a2944108e1e5d9a1af4696acac476813795183d4846845a'
        'eb1a1d8b6b034d0141b7d6f030ffc825745e1f04bfed83950d860a28e6720df6bdc97b81f01986e27de39b6be188fc858d4e060d31d1f55ba3634696fe8c1dba')

prepare() {
  cd "$pkgname"

  # fix install script
  git checkout 5badd0912bbede48056fc3ba66d8a28a0b92ead2
  patch -p1 -i "$srcdir/avoid-libexec.patch"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --frozen --release

  # generate shell completions
  ./target/release/generate-completions target/release/completions
}

check() {
  cd "$pkgname/bear"

  cargo test --frozen
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" PREFIX=/usr ./scripts/install.sh
}
