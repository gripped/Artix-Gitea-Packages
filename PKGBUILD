# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-dns
pkgver=2.3.6.0
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for UNIX systems"
arch=('x86_64')
url="https://skarnet.org/software/s6-dns/"
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libdcache.so' 'libs6dns.so' 'libskadns.so')
source=("https://skarnet.org/software/s6-dns/${pkgname}-${pkgver}.tar.gz")
sha256sums=('01e7c7532cc5e7a6b8915461b01c2f706b7f2211782923e25eaa54ee0c6dc7c7')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
