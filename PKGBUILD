# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-dns
pkgver=2.3.7.1
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for UNIX systems"
arch=('x86_64')
url="https://skarnet.org/software/s6-dns/"
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libdcache.so' 'libs6dns.so' 'libskadns.so')
source=("https://skarnet.org/software/s6-dns/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cf0258574ec7d62b654e0c2ad78af4c7d67ac4c9cb37f781480f597e54b30f6d')

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
