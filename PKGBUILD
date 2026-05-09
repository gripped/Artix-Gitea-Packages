# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-linux-utils
pkgver=2.6.4.1
pkgrel=1
pkgdesc='Tiny Linux-specific utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-utils/'
license=('ISC')
depends=('skalibs')
makedepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('16e1a5b5a2b4a98674b4a9719612adb79588e3c20c4083360278ea38f2d32129')
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
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
