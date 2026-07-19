# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-networking
pkgver=2.8.0.1
pkgrel=1
pkgdesc="A suite of small networking tools for UNIX systems."
arch=('x86_64')
url="https://skarnet.org/software/s6-networking/"
license=('ISC')
depends=('s6' 's6-dns' 'bearssl')
provides=('libs6net.so')
source=("https://skarnet.org/software/s6-networking/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f011c33ba0586ce58feee0cf854a0b087e9082fdbd24abb786148463830f341')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --enable-ssl=bearssl \
              --with-pkgconfig
  make
}

package() {
  depends+=('libs6.so' 'libs6dns.so')
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
