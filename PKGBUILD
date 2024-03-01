# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=dvisvgm
pkgver=3.2.1
pkgrel=1
pkgdesc='A fast DVI, EPS, and PDF to SVG converter'
arch=(x86_64)
url='https://dvisvgm.de/'
license=(GPL-3.0-or-later)
depends=(brotli
         freetype2
         gcc-libs
         ghostscript
         glibc
         potrace
         texlive-bin
         woff2
         zlib)
optdepends=('mupdf-tools: to process PDF files')
makedepends=(python)
source=(https://github.com/mgieseki/dvisvgm/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('74c1eac7bdd206af9f13deb9533080dc8d7c649b16564881540b86175036102a')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
