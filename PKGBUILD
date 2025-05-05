# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=tipidee
pkgver=0.0.6.0
pkgrel=1
pkgdesc="A small and fast HTTP/1.1 server."
arch=('x86_64')
url="https://skarnet.org/software/tipidee/"
license=('ISC')
depends=('skalibs' 'libskarnet.so' 's6-networking' 'bearssl')
provides=('libtipidee.so')
source=("https://skarnet.org/software/tipidee/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2add8be1089022e3790241b93ac4a5a3e58dad645f5d919f8cba744cd4a1702')

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
