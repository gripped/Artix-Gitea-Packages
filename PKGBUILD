# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-dns
pkgver=2.3.7.0
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for UNIX systems"
arch=('x86_64')
url="https://skarnet.org/software/s6-dns/"
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libdcache.so' 'libs6dns.so' 'libskadns.so')
source=("https://skarnet.org/software/s6-dns/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aeeb2776cb234e90397a78c6aa3725924aa0710c1035ca70dd5628b84c6701d1')

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
