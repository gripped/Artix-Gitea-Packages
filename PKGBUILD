# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libqalculate
pkgver=5.0.0
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
             intltool)
optdepends=('gnuplot: for plotting support')
source=(https://github.com/Qalculate/libqalculate/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('591598dedbcbd80119de052559873530030b3510bca2b0758f088cfb7dafb2ee')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
