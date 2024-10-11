# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.14.3.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('a14aa558c9b09b062fa16acec623b2c8f93d69f5cba4d07f6d0c58913066c427')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
      --datadir=/etc \
      --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
