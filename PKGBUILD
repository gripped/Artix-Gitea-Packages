# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=execline
pkgver=2.9.8.0
pkgrel=1
pkgdesc='A small scripting language, to be used in place of a shell in non-interactive scripts.'
arch=('x86_64')
url='https://skarnet.org/software/execline'
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libexecline.so')
source=(https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d05e0b75cc21841692119c7a7838163acd7f05318bd69e779068266daa7ce91f')

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
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
