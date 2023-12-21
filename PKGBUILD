# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6
pkgver=2.12.0.3
pkgrel=1
pkgdesc="skarnet.org's small & secure supervision software suite. Comes with an ultra-fast init replacement, process management tools, an asynchronous locking library, and more."
arch=('x86_64')
url='https://skarnet.org/software/s6/'
license=('ISC')
depends=('skalibs' 'execline' 'libskarnet.so' 'libexecline.so')
provides=('libs6.so')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "s6log.conf")
sha256sums=('800d31226f6c25cdd3ec0b65240f80b56ce5ec137341d0a8d154e77638e58103'
            'cb6cc5ca87185ab72aa00857752b6b5436f7653e3d8812dc2704df020c212822')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --libexecdir=/usr/lib \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 $srcdir/s6log.conf "$pkgdir/usr/lib/sysusers.d/s6log.conf"
}
