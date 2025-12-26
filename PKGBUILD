# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.14.5.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('d8d9ec756b112ab6d4a9896ba0f53aca92559bc90aeaccd53ed8177e6e159764')

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
