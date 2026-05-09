# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.15.0.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('7fde96e8afb4191593a15328883e9c7726c96891cf071222146821e8c87f8007')

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
