# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=blocaled
pkgver=0.5
pkgrel=1
pkgdesc='Provides a stand-alone implementation of the localed D-Bus service.'
arch=('x86_64')
url='https://github.com/lfs-book/blocaled'
license=('BSD')
depends=('polkit' 'libdaemon')
makedepends=('gtk-doc')
conflicts=('openrc-settingsd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5b5e49b39e001bc1715ae5e8568939226a217b6d66a04fed4f4e2923d3273176')

build(){
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/blocaled \
        --with-keyboardconfig=/etc/vconsole.conf \
        --with-localeconfig=/etc/locale.conf
    make
}

check(){
    cd ${pkgname}-${pkgver}
    make -k check
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
