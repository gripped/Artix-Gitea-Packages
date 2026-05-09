# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-rc
pkgver=0.6.1.1
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('s6' 'libs6.so')
provides=('libs6rc.so')
makedepends=('git')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b54f226a35be1ee56a228bf1a4c39437f072bc64e69dbf356e733e606a86402d')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
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
