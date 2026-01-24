# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-rc
pkgver=0.6.0.0
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('s6' 'libs6.so')
provides=('libs6rc.so')
makedepends=('git')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('46d4a62959ef16097b84dcfb0c3b31a6ff49aa476d4aeec9c5b7bde1ce684901')

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
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
