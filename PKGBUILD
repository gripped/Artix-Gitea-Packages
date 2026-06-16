# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=voa
pkgver=0.7.4
pkgrel=1
pkgdesc="CLI for interacting with the File Hierarchy for the Verification of OS Artifacts (VOA)"
arch=(x86_64)
url="https://voa.archlinux.page"
_url="https://gitlab.archlinux.org/archlinux/alpm/voa"
license=('Apache-2.0 OR MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  git
  just
  lowdown
  rust
  rust-script
)
checkdepends=(
  cargo-nextest
)
source=(
  $pkgname::git+${_url}.git?signed#tag=$pkgname/$pkgver
)
sha512sums=('85800411d4cb278162c69dbd85eecf92ddeedfa06ec465532efc98bf1f8cd437435b4695f3514a2adda95a588b660a447ddd09108578baeaec05b43c5f0cc2b2')
b2sums=('fb532d8d04a0312429b542be7f507b8340876c1f8016f74cb17fc8aa5bdc348a23dc7fcde2162e24b90691a6105175f203bc0d21d3f3ef41249f31f04efd750a')
validpgpkeys=(991F6E3F0765CF6295888586139B09DA5BF0D338)  # David Runge <dvzrv@archlinux.org>

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname
  cargo build --features cli --frozen --release --package voa

  just generate shell_completions voa
  just generate specifications voa-config
  just generate manpages voa
}

check() {
  cd $pkgname
  XDG_RUNTIME_DIR="/run/user/$(uid)/" cargo nextest run --package voa
}

package() {
  cd $pkgname
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/bin/"

  install -vDm 644 output/manpages/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 output/manpages/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -vDm 644 output/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 output/shell_completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 output/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
