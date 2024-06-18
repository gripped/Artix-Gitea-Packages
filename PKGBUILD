# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mdevd
pkgver=0.1.6.4
pkgrel=1
pkgdesc='A Linux kernel event manager daemon (like udevd) that understands the mdev configuration file format and does not fork.'
arch=('x86_64')
url='https://skarnet.org/software/mdevd'
license=('ISC')
depends=('skalibs' 'execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7358ce530b6b9befb715e48190981e9b69a12cca858519e6d2e4b46eab7e2470')

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
