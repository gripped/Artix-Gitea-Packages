# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-portable-utils
pkgver=2.3.1.1
pkgrel=1
pkgdesc='Tiny portable generic utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-portable-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cf08d71963c0ea1708cdd82bd40ad301154bccc59b68eefb428aa79b42273242')
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --libexecdir=/usr/lib \
              --disable-allstatic \
              --disable-static \
              --enable-shared \
              --enable-pkgconfig \
              --with-pkgconfig
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
