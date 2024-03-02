# Maintainer: Torr <torr@artixlinux.org>
pkgname=ziproxy
pkgver=3.3.2
pkgrel=1
pkgdesc="forwarding (non-caching) compressing HTTP proxy server"
arch=("x86_64")
url="https://ziproxy.sourceforge.net"
## File: https://sourceforge.net/p/ziproxy/code/HEAD/tree/trunk/ziproxy-default/ChangeLog?format=raw
changelog=Changelog.txt
license=("GPL2")
depends=(
	"glibc"
	"zlib"
	"giflib"
	"libjpeg-turbo"
	"libpng"
	"jasper"
	"libsasl"
)
makedepends=(
	"gcc"
	"make"
)
source=(
	"$pkgver.tar.xz::https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz/download"
)
sha256sums=(
	"45658965decd0b32f1065d1bb22429981b16608c89058a507a51cf3b7927fbe2"
)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--with-jasper
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
