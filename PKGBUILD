# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mdevd
pkgver=0.1.8.1
pkgrel=1
pkgdesc='A Linux kernel event manager daemon (like udevd) that understands the mdev configuration file format and does not fork.'
arch=('x86_64')
url='https://skarnet.org/software/mdevd'
license=('ISC')
depends=('skalibs' 'execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('93d2bba7299ff3b1b9f249928c2e84e23a5af3d829ebd9677ea44535c585aa82')

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
