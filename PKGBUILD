# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-networking
pkgver=2.6.0.0
pkgrel=1
pkgdesc="A suite of small networking tools for UNIX systems."
arch=('x86_64')
url="https://skarnet.org/software/s6-networking/"
license=('ISC')
depends=('s6' 's6-dns' 'bearssl' 'libs6.so' 'libs6dns.so')
provides=('libs6net.so')
source=("https://skarnet.org/software/s6-networking/${pkgname}-${pkgver}.tar.gz")
sha256sums=('31d1d68fb05d639cebe9514bba2f67a54e5801f26c0d162f8755cd4b162e18b0')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --enable-ssl=bearssl \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
