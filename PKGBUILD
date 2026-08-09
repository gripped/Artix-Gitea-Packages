# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-frontend
pkgver=0.1.0.0
pkgrel=6
pkgdesc='A higher-level interface to the s6 ecosystem.'
arch=('x86_64')
url='https://skarnet.org/software/s6-frontend'
license=('ISC')
depends=('s6' 's6-rc' 's6-linux-init')
makedepends=('git')
backup=('etc/s6-frontend.conf')
install=s6-frontend.install
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "s6-frontend.conf"
        "2baca28a72c95c48d3e28125e09feff183aae1e8.patch"
        "c68082ba3dae88bcfe68f77703a6169ba8ec8283.patch")
sha256sums=('ed7bba6f2c13dd16ebf17fda0d482f4ba4848d80f5b4d7edd22d8b60a869f994'
            '4805d0c844cfe43685f4f0c5e1d3c24b150339779e335266619e366bfa62a2d1'
            'ca0007b2ca2a4a4271f4cee3505fa51cff61a04d7c262b8e67ba5e559dd0650a'
            '9a64a0a5d0afe8f0b4da38dc03ad9cf83785c9ec93bbdc564edd57afeedf31b1')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../2baca28a72c95c48d3e28125e09feff183aae1e8.patch
  patch -Np1 -i ../c68082ba3dae88bcfe68f77703a6169ba8ec8283.patch
}

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
