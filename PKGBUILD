# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.13
pkgrel=1
pkgdesc='POSIX compliant shell that aims to be as small as possible'
url='http://gondor.apana.org.au/~herbert/dash/'
arch=('x86_64')
license=('BSD-3-Clause' 'GPL-2.0-or-later')
depends=('glibc' 'libedit' 'libedit.so')
install=dash.install
source=(https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${pkgname}-${pkgver}.tar.gz)
sha512sums=('879cfd80d36385dbf33cc2b93773a853633da16d39e8bb94bc3351abc785cc68a3f60e66b6bfb4a6a7ce38ea3190c5f06679a50e8ba894a79bc9a2cbb4e99438')
b2sums=('9ac69893e20fdf1e990a76507be15060eefcb0af7610ff14f7130f68634167214aae351cf26440097f942e3435a5bdd5f549997826e94756f8e82eb9508bab29')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make V=1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
