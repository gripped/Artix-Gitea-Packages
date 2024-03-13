# Maintainer: artist for Artix Linux

pkgname=alacritty
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
pkgver=0.13.1
pkgrel=1
arch=('x86_64')
url="https://github.com/alacritty/alacritty"
license=('Apache')
makedepends=('git' 'rust' 'llvm' 'cargo' 'cmake' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'scdoc')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
optdepends=('ncurses: for alacritty terminfo database')
source=("git+$url.git"
        "title.patch")
validpgpkeys=('4DAA67A9EA8B91FCC15B699C85CDAE3C164BA7B4'  # Christian Dürr <contact@christianduerr.com>
              'A56EF308A9F1256C25ACA3807EA8F8B94622A6A9') # Kirill Chibisov <contact@kchibisov.com>
sha256sums=('SKIP'
            '8fc4ff8fd34ebad386332c8dcb48ead836d25b9c4749918504626369de07b723')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
  cd "$pkgname"
  patch -Np1 -i ../title.patch
  CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

check(){
  cd "$pkgname"
  CARGO_INCREMENTAL=0 cargo test --locked --offline
}

package() {
  cd "$pkgname"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extra/linux/Alacritty.desktop"
  install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
  scdoc < "extra/man/alacritty.1.scd" | install -D -m644 /dev/stdin \
          "$pkgdir/usr/share/man/man1/alacritty.1"
  scdoc < "extra/man/alacritty.5.scd" | install -D -m644 /dev/stdin \
          "$pkgdir/usr/share/man/man5/alacritty.5"
  scdoc < "extra/man/alacritty-msg.1.scd" | install -D -m644 /dev/stdin \
          "$pkgdir/usr/share/man/man1/alacritty-msg.1"
  scdoc < "extra/man/alacritty-bindings.5.scd" | install -D -m644 /dev/stdin \
          "$pkgdir/usr/share/man/man5/alacritty-bindings.5"
  install -D -m644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
  install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
  install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
  install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
  install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
}
