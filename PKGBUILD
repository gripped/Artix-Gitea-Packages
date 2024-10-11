# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mdevd
pkgver=0.1.6.5
pkgrel=1
pkgdesc='A Linux kernel event manager daemon (like udevd) that understands the mdev configuration file format and does not fork.'
arch=('x86_64')
url='https://skarnet.org/software/mdevd'
license=('ISC')
depends=('skalibs' 'execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5c86420c81b2e4720b41e4f48f727cd5d9a17f4e6317115d21c32099e72a628')

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
