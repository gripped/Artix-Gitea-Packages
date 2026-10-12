# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Severen Redwood <me@severen.dev>
# Contributor: Tomasz Jakub Rup <tomasz.rup@gmail.com>

pkgname=pnpm
pkgver=12.12.1
pkgrel=2
pkgdesc='Fast, disk space efficient package manager'
arch=(x86_64)
url=https://pnpm.io
license=(MIT)
depends=(sh glibc libgcc)
makedepends=(cargo git mold npm)
source=("git+https://github.com/$pkgname/$pkgname.git#tag=v$pkgver?signed")
b2sums=('4d48d9d15061ddb3e842b1fc4ee391116a200e51fbda4c24fca0f9c80a42b8cb49b641cb8ae13677bd59b831855a32b696b99f7440c1a10c88aa4933478fa64e')
validpgpkeys=(7B74D1299568B586BA9962B5649E4D4AF74E7DEC) # Zoltan Kochan <z@kochan.io>

prepare() {
  cd $pkgname

  # Generate pnpm/crates/deps-restorer/src/cas-loader.mjs.inc.
  catalog() { awk -v p="$1" '/^catalog:/{c=1;next} /^[^ #]/{c=0} c && $1==p":"{print $2}' pnpm-workspace.yaml; }
  npm install --prefix "$srcdir/deps" --ignore-scripts --no-audit --no-fund \
    "enhanced-resolve@$(catalog enhanced-resolve)" "esbuild@$(catalog esbuild)"
  ln -s "$srcdir/deps/node_modules" pnpm/esm-loader/node_modules
  node pnpm/esm-loader/scripts/bundle-runtime.mjs

  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname
  export RUSTFLAGS+=" -C link-args=-fuse-ld=mold"
  cargo build --frozen --release --all-features -p pnpm-cli --bin pnpm
}

package() {
  cd $pkgname
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  install -Dm0644 <(target/release/pnpm completion bash) "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 <(target/release/pnpm completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm0644 <(target/release/pnpm completion zsh) "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # Create common aliases
  cd "$pkgdir/usr/bin"
  ln -s pnpm pn
  # pnx/pnpx are just `pnpm dlx` wrapper
  install -Dm0755 <(echo -e '#!/bin/sh\nexec /usr/bin/pnpm dlx "$@"') pnpx
  ln -s pnpx pnx
}
