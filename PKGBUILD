# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-linux-utils
pkgver=2.6.2.0
pkgrel=1
pkgdesc='Tiny Linux-specific utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8f944633ca87d3d23e0f03c9c383d1502d508c9bac16d38c3fbf723a5eab2bb7')
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
