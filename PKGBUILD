# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=tipidee
pkgver=0.0.7.2
pkgrel=1
pkgdesc="A small and fast HTTP/1.1 server."
arch=('x86_64')
url="https://skarnet.org/software/tipidee/"
license=('ISC')
depends=('skalibs' 'libskarnet.so' 's6-networking' 'bearssl')
provides=('libtipidee.so')
source=("https://skarnet.org/software/tipidee/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c77e12b7db3fdc56dc23db379dca668616e742603fe867fa2bdc8d4f1aca8f9b')

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
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
