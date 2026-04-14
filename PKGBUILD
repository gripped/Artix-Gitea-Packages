# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

pkgname=dqlite
pkgver=1.18.5
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('LGPL-3.0-only')
depends=('glibc' 'libuv' 'sqlite' 'lz4')
makedepends=('tcl' 'readline' 'zlib')
options=(strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz"
        correct-const-qualifier.patch::https://github.com/canonical/dqlite/pull/875/commits/23d5214466190c552b599187b1ea80f2abe1db31.patch)
sha256sums=('491a460ba61282447faeba75238c9d0e461cbd743a84f122417ae6507c455868'
            'a539354e3a3d32d56ff2aedcb86e2a257aa0a28f7224b054fa7ebd73380e85e5')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i ../correct-const-qualifier.patch
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i 
	#PKG_CONFIG_PATH="/usr/lib/sqlite-replication/pkgconfig" ./configure --prefix=/usr
	./configure --prefix=/usr --enable-build-raft
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
