# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-linux-utils
pkgver=2.6.2.1
pkgrel=1
pkgdesc='Tiny Linux-specific utilities.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-utils/'
license=('ISC')
depends=('skalibs')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('915f167294d36ca9240a62281c7299b5ad5d558b8d45d888761135749d9fd234')
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --libexecdir=/usr/lib \
              --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
