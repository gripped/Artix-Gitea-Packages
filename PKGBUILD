# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.14.5.1
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('fa359c70439b480400a0a2ef68026a2736b315025a9d95df69d34601fb938f0f')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
      --datadir=/etc \
      --disable-static \
      --enable-pkgconfig \
      --enable-shared \
      --with-pkgconfig
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
