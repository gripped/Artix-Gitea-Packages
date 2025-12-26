# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-linux-utils
pkgver=2.6.4.0
pkgrel=1
pkgdesc='Tiny Linux-specific utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-utils/'
license=('ISC')
depends=('skalibs')
makedepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc727f70d5e8780433a497acb7cb3100656b3126589ab02e9d2042006c794cf2')
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
