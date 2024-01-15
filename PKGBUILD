# Maintainer: Thomas Bächler <thomas@archlinux.org>

_pkgbasename=attr
pkgname=lib32-$_pkgbasename
pkgver=2.5.1
pkgrel=1
pkgdesc='Extended attribute support library for ACL support (32-bit)'
arch=(x86_64)
url='https://savannah.nongnu.org/projects/attr'
license=('LGPL')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib' 'gettext')
provides=('libattr.so')
source=("https://download.savannah.gnu.org/releases/attr/attr-${pkgver}.tar.xz")
sha256sums=('db448a626f9313a1a970d636767316a8da32aede70518b8050fa0de7947adc32')

build() {
	cd "${srcdir}"/attr-${pkgver}

	export CC="gcc -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	./configure \
		--prefix=/usr \
		--libdir=/usr/lib32 \
		--libexecdir=/usr/lib32 \
		--sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}"/attr-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}
