# Maintainer: Torr <torr[at]artixlinux[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Rorschach <r0rschach@lavabit.com>

pkgname=torsocks
pkgver=2.4.0
pkgrel=4
pkgdesc="Wrapper to transparently torify an application"
url="https://gitlab.torproject.org/tpo/core/torsocks"
## File: https://gitlab.torproject.org/tpo/core/torsocks/-/blob/main/changelog
changelog=Changelog.txt
arch=("x86_64")
depends=("tor")
makedepends=(
	"autoconf"
	"automake"
	"gcc"
	"libtool"
)
backup=("etc/tor/$pkgname.conf")
source=(https://gitlab.torproject.org/tpo/core/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('c01b471d89eda9f3c8dcb85a448e8066692d0707f9ff8b2ac7e665a602291b87')
license=('GPL2')

# prepare(){
	# cd $pkgname-v$pkgver

# }

build() {
	cd $pkgname-v$pkgver
	./autogen.sh
	sed -i 's/| -V//g' configure
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var
	make
}

package() {
	cd $pkgname-v$pkgver
	make DESTDIR="$pkgdir" install
}
