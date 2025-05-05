# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-portable-utils
pkgver=2.3.1.0
pkgrel=1
pkgdesc='Tiny portable generic utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-portable-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04244aa87ae2c412d4999769b5e73cb428afba0c2e8aa9215b3a36e7be2a80f9')
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
