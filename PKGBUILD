# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=rng-tools
pkgver=6.17
pkgrel=3
pkgdesc="Random number generator related utilities"
arch=('x86_64')
url="https://github.com/nhorman/rng-tools"
license=('GPL-2.0-or-later')
depends=('curl' 'libxml2' 'sysfsutils' 'jitterentropy' 'libp11' 'jansson' 'rtl-sdr')
optdepends=('opensc: PKCS11 entropy engine to gather entropy from smart card readers')
backup=(etc/conf.d/rngd)
source=(https://github.com/nhorman/rng-tools/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        rngd.conf)
sha256sums=('4aa50994232da74499b60b3ebf79118e30a1943be375b7d931dcf18df5442fd3'
            'f4fd197dd682cdab07ddeabe8d3b73b1bc2e1cf322237be238a26b49a7dcb047')

prepare() {
	cd $pkgname-$pkgver
	mv README{.md,}

	# this test hangs, probably for lack of entropy in chroot
	sed s/rngtestjitter.sh// -i tests/Makefile.am

	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

check() {
	cd $pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm644 ../rngd.conf "$pkgdir"/etc/conf.d/rngd
}
