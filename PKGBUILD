# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-dns
pkgver=2.4.1.0
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for UNIX systems"
arch=('x86_64')
url="https://skarnet.org/software/s6-dns/"
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libs6dns.so' 'libskadns.so')
source=("https://skarnet.org/software/s6-dns/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b6308519f109a67469c4aaafa9df1f009ad0961fa798ffc38f895587e6935729')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --with-pkgconfig
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
