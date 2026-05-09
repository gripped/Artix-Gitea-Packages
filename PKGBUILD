# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-portable-utils
pkgver=2.3.1.2
pkgrel=1
pkgdesc='Tiny portable generic utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-portable-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cfb90186d0c0eb204e1e5c6f9379e99413c546bccf38bb6e76177f82371aa3aa')
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
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
