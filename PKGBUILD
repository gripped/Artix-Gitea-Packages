# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-frontend
pkgver=0.2.0.0
pkgrel=1
pkgdesc='A higher-level interface to the s6 ecosystem.'
arch=('x86_64')
url='https://skarnet.org/software/s6-frontend'
license=('ISC')
depends=('s6' 's6-rc' 's6-linux-init')
makedepends=('git')
backup=('etc/s6-frontend.conf')
install=s6-frontend.install
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "s6-frontend.conf")
sha256sums=('4bce4e9bec8c1de9e3ee5ef764580421504a3c6303eff96997b69d1b89219536'
            '4805d0c844cfe43685f4f0c5e1d3c24b150339779e335266619e366bfa62a2d1')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --conffile=/etc/s6-frontend.conf \
              --disable-allstatic \
              --disable-static \
              --enable-pkgconfig \
              --enable-shared \
              --enable-util-linux \
              --with-pkgconfig
  make
}

package() {
  depends+=('libs6.so' 'libs6rc.so' 'libs6_linux_init.so')
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -v -d -m2755 "${pkgdir}"/etc/s6/repo
  install -Dm644 "${srcdir}"/s6-frontend.conf "${pkgdir}/etc/s6-frontend.conf"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
