# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-portable-utils
pkgver=2.3.0.3
pkgrel=1
pkgdesc='Tiny portable generic utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-portable-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3e4492055d160c25fb90153f0efc277d7d52bf981bbe3ea2e9dfe51c493561ff')
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --libexecdir=/usr/lib \
              --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
