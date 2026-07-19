# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-dns
pkgver=2.4.1.3
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for UNIX systems"
arch=('x86_64')
url="https://skarnet.org/software/s6-dns/"
license=('ISC')
depends=('skalibs')
provides=('libs6dns.so' 'libskadns.so')
source=("https://skarnet.org/software/s6-dns/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f9e9deb4648c5507a8485548364bd1c56dabda394bc9ee2d7f1cbb16a036cd76')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --with-pkgconfig
  make
}

package() {
  depends+=('libskarnet.so')
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
