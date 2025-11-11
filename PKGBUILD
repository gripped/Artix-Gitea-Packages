# Maintainer: artist for Artix Linux

pkgname=leftwm
pkgver=0.5.4
pkgrel=2
pkgdesc="A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
depends=(gcc-libs)
makedepends=('cargo' 'git')
optdepends=('bash: themes'
            'dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
	cd $pkgbase-$pkgver
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgbase-$pkgver

	export CARGO_TARGET_DIR=target_non_systemd
	cargo build --frozen --release --no-default-features --features=lefthk,sys-log,xlib
}

package() {
        cd $pkgbase-$pkgver/target_non_systemd/release
	install -Dm755 leftwm{,-worker,-state,-check,-command} lefthk-worker -t "$pkgdir"/usr/bin/

	cd ../../
	install -Dm644 leftwm/doc/leftwm.1 -t "$pkgdir"/usr/share/man/man1/
	install -d "$pkgdir"/usr/share/leftwm
	cp -R themes "$pkgdir"/usr/share/leftwm
	install -Dm644 leftwm.desktop -t "$pkgdir"/usr/share/xsessions/
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/leftwm/LICENSE
}

sha256sums=('5889843e64377f8c09edae51cadeddb9e6dab599e51c96fcc8314ceb4a5a7f16')
