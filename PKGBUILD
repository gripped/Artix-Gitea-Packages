# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-networking
pkgver=2.7.1.0
pkgrel=1
pkgdesc="A suite of small networking tools for UNIX systems."
arch=('x86_64')
url="https://skarnet.org/software/s6-networking/"
license=('ISC')
depends=('s6' 's6-dns' 'bearssl' 'libs6.so' 'libs6dns.so')
provides=('libs6net.so')
source=("https://skarnet.org/software/s6-networking/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a7b33497e72921a59d4c1fc67ce5cc74bd065e09105bf1a79f1fc73cf9a06592')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --enable-ssl=bearssl \
              --with-pkgconfig
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
