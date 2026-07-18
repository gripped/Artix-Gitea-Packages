# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.15.1.0
pkgrel=2
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('f9c905e74935c6fe911c7e344e3e89d5fbd2014c1a04650b524b15ce9b5635d1')

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
  provides=('libskarnet.so')
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
