# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=execline
pkgver=2.9.7.0
pkgrel=1
pkgdesc='A small scripting language, to be used in place of a shell in non-interactive scripts.'
arch=('x86_64')
url='https://skarnet.org/software/execline'
license=('ISC')
depends=('skalibs' 'libskarnet.so')
provides=('libexecline.so')
source=(https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz
        fix-configure.patch)
sha256sums=('73c9160efc994078d8ea5480f9161bfd1b3cf0b61f7faab704ab1898517d0207'
            '3ac29337324412349b8f036d01ddffa072e9dd0fbdb0409fa8d6b4166b4f39b1')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../fix-configure.patch
}

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
