# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-rc
pkgver=0.8.0.2
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('glibc' 's6')
provides=('libs6rc.so')
makedepends=('git')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2fc0fcfe1e74b404b132a978eb316668c8bcdbc1104b3b0fe702a3d2d76caef5')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --with-pkgconfig
  make
}

package() {
  depends+=('libs6.so')
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
