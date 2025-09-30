# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=unixodbc
pkgver=2.3.13
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
url="http://www.unixodbc.org/"
backup=('etc/odbc.ini' 'etc/odbcinst.ini')
depends=('readline' 'libltdl' 'glibc')
provides=('libodbc.so' 'libodbccr.so' 'libodbcinst.so')
source=(
    https://www.unixodbc.org/unixODBC-$pkgver.tar.gz
    #ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz
)
sha256sums=('119afef5f4cb04e780ca6cf763265b9fb2b99c4c11349a3f9cab14069d2c7c2b')

prepare() {
    cd unixODBC-${pkgver}
    autoreconf -vfi
}

build() {
    cd unixODBC-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/etc
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd unixODBC-${pkgver}
    make -k check
}

package() {
    cd unixODBC-${pkgver}
    make DESTDIR="${pkgdir}" install
    touch "$pkgdir"/etc/{odbc,odbcinst}.ini
}
