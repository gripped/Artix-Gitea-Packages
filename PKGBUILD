# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-frontend
pkgver=0.0.1.1
pkgrel=1
pkgdesc='A higher-level interface to the s6 ecosystem.'
arch=('x86_64')
url='https://skarnet.org/software/s6-frontend'
license=('ISC')
depends=('s6' 'libs6.so' 's6-rc' 'libs6rc.so' 's6-linux-init' 'libs6_linux_init.so')
makedepends=('git')
backup=('etc/s6-frontend.conf')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "s6-frontend.conf")
sha256sums=('2c1ac4f64b04400cd7c81cd9be222be52b07b7d8955a876b9f9f3f8c2328dfeb'
            '4805d0c844cfe43685f4f0c5e1d3c24b150339779e335266619e366bfa62a2d1')

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
  install -v -d "${pkgdir}"/etc/s6/repo
  install -Dm644 "${srcdir}"/s6-frontend.conf "${pkgdir}/etc/s6-frontend.conf"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
