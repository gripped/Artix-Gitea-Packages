# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6
pkgver=2.14.0.1
pkgrel=1
pkgdesc="skarnet.org's small & secure supervision software suite. Comes with an ultra-fast init replacement, process management tools, an asynchronous locking library, and more."
arch=('x86_64')
url='https://skarnet.org/software/s6/'
license=('ISC')
depends=('skalibs' 'execline' 'libskarnet.so' 'libexecline.so')
provides=('libs6.so')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "s6log.conf")
sha256sums=('c25afe817cbc3f594efc5050351f8b9101ba78616d0ce915658f370e7ee2e258'
            'cb6cc5ca87185ab72aa00857752b6b5436f7653e3d8812dc2704df020c212822')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
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
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 $srcdir/s6log.conf "$pkgdir/usr/lib/sysusers.d/s6log.conf"
}
