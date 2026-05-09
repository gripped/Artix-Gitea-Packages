# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mdevd
pkgver=0.1.8.2
pkgrel=1
pkgdesc='A Linux kernel event manager daemon (like udevd) that understands the mdev configuration file format and does not fork.'
arch=('x86_64')
url='https://skarnet.org/software/mdevd'
license=('ISC')
depends=('skalibs' 'execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ce1ae0149b6a57a34f608218fd6181aa6aa68135cac2f4d931b5b417b072e244')

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
