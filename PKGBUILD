# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=cryptsetup-scripts
pkgver=2.7.2
pkgrel=1
_debver=2
pkgdesc="cryptsetup supporting scripts by Debian"
arch=("x86_64")
url="https://salsa.debian.org/cryptsetup-team/cryptsetup"
license=('GPL')
groups=()
depends=("cryptsetup")
makedepends=('scdoc')
conflicts=("openrc") # openrc uses /etc/conf.d/dmcrypt instead of crypttab
source=("https://salsa.debian.org/cryptsetup-team/cryptsetup/-/archive/debian/2%25${pkgver}-${_debver}/cryptsetup-debian-2%25${pkgver}-${_debver}.tar.gz"
        "0004-remove-lsb-script-dependency-from-cryptdisks.patch"
        "Makefile.patch"
        "crypttab.5.scd")
sha256sums=('aea822523fea11ff3965584e11d0e6b6dbbae273691a2e523ae6acbc0bbcc90b'
            '1c36c3a4844332436c5b62e275582b0ece637e1fc3ab0b61eb06bc1fc783baae'
            'ff9f21cdad2cd9e42bfbe9db3158572a81414bbd6b3766dff0e30b59c5e0d869'
            '7e71e820d3e95f7efbbdeb9fd84510d51e06faaa8da07cb4a099421943f313ab')

prepare() {
	cd "cryptsetup-debian-2%${pkgver}-${_debver}"
	patch -p1 < ../Makefile.patch
	patch -p1 < ../0004-remove-lsb-script-dependency-from-cryptdisks.patch
}

build() {
	scdoc < crypttab.5.scd > crypttab.5
	cd "cryptsetup-debian-2%${pkgver}-${_debver}"
	make
}

package() {
	cd "cryptsetup-debian-2%${pkgver}-${_debver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../crypttab.5.scd "$pkgdir/usr/share/man/man5/crypttab.5"
}
