# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-linux-utils
pkgver=2.6.3.0
pkgrel=1
pkgdesc='Tiny Linux-specific utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7e249c36c73b99ebfc1f9a9a4c318be76b461ebc53d3952de9064ccfab400739')
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --libexecdir=/usr/lib \
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
