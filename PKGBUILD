# Maintainer: Torr <torr@artixlinux.org>
pkgname=proxytunnel
pkgver=1.12.1
pkgrel=1
pkgdesc="Stealth tunneling through HTTP(S) proxies."
arch=("x86_64")
url="https://proxytunnel.sourceforge.io"
## File: https://github.com/proxytunnel/proxytunnel/blob/master/CHANGES
changelog=Changelog.txt
license=("GPL2")
depends=(
	"openssl"
)
makedepends=(
	"gcc"
	"make"
	"pkgconf"
	"asciidoc"
	"xmlto"
)
source=(
	"https://github.com/proxytunnel/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	"acc111ba4ef47a61878eb480636941add36edb38defae22dd54288bcf036cdc4"
)


build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install prefix=/usr DESTDIR="$pkgdir"
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
