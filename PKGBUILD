# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mdevd
pkgver=0.1.7.0
pkgrel=1
pkgdesc='A Linux kernel event manager daemon (like udevd) that understands the mdev configuration file format and does not fork.'
arch=('x86_64')
url='https://skarnet.org/software/mdevd'
license=('ISC')
depends=('skalibs' 'execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec966eec39879f33c785343373021c44f887c836a08fcaf1d63412e3bdbfca32')

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
