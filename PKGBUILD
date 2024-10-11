# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-rc
pkgver=0.5.5.0
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('s6' 'libs6.so')
provides=('libs6rc.so')
makedepends=('git')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c3b5f1b8d3acea60a20a59fb25280b69a6aac0bb3afdab21d2edeada77b2df01')

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
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
