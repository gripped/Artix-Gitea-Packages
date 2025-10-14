# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libqalculate
pkgver=5.8.0
pkgrel=1
pkgdesc='Multi-purpose desktop calculator'
arch=(x86_64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(curl
         icu
         gcc-libs
         glibc
         gmp
         libxml2
         mpfr
         readline)
makedepends=(doxygen
             git
             intltool)
optdepends=('gnuplot: for plotting support')
source=(git+https://github.com/Qalculate/libqalculate#tag=v$pkgver)
sha256sums=('7c06c45ac18d752db0a4d9a14dc2c23067943fe7fe431fc4cf2aefca070dc1e7')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
