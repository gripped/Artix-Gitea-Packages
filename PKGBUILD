pkgname=proxytunnel
pkgver=1.12.2
pkgrel=1.1
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
	"edb33a74ba49e745b55b790f123366c8336729947225f4b5d816f1f90551ecfe"
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
