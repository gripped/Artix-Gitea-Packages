# Maintainer: Torr <torr@artixlinux.org>
pkgname=tinyproxy
pkgver=1.11.1
pkgrel=1
pkgdesc="Light-weight HTTP/HTTPS proxy daemon for POSIX operating systems"
arch=("x86_64")
url="https://tinyproxy.github.io"
license=("GPL2")
backup=("etc/tinyproxy/tinyproxy.conf")
depends=("glibc")
makedepends=("gcc" "make" "automake" "autoconf")
source=(
	"https://github.com/tinyproxy/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"e6ab59545003b43e30112cabe78914402867cfe017b58f7e062165a29656e366"
)

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-xtinyproxy \
		--enable-filter \
		--enable-upstream \
		--enable-transparent \
		--enable-reverse
	make
}

check() {
	cd $pkgname-$pkgver
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
