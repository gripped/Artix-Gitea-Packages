# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=execline
pkgver=2.9.9.1
pkgrel=1
pkgdesc='A small scripting language, to be used in place of a shell in non-interactive scripts.'
arch=('x86_64')
url='https://skarnet.org/software/execline'
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libexecline.so')
source=(https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('be63533297a93c36fd267195117b4e668687a526f834517a8db47d85b6c7ec6a')

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
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
