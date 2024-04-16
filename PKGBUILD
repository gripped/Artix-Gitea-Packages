# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=skalibs
pkgver=2.14.1.1
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('x86_64')
depends=('glibc')
provides=('libskarnet.so')
source=(http://www.skarnet.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('b6b79b816f4ba0b6801676b0ed4179b59c8c7809eeffe26db672e404636befc3')

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
