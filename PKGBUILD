# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=tipidee
pkgver=0.0.5.0
pkgrel=1
pkgdesc="A small and fast HTTP/1.1 server."
arch=('x86_64')
url="https://skarnet.org/software/tipidee/"
license=('ISC')
depends=('skalibs' 'libskarnet.so' 's6-networking' 'bearssl')
provides=('libtipidee.so')
source=("https://skarnet.org/software/tipidee/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9e91fc719879a43d54329b99b02c6649c54e428e77bc96a0573506b52bf1422')

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
