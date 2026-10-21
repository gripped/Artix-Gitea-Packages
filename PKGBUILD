# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.16.0.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('90a3deda94a40d7d6a4495fe6feaf91c0185e0428d59cbd150a1a468741269aa')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
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
