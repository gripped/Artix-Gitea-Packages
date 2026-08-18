# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters
pkgver=2.2.1
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
# keep poppler for pdftoppm
depends=('libcups' 'libexif' 'pdfio' 'libjxl' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2'
         'fontconfig' 'glibc' 'dbus')
makedepends=(
	'ghostscript' 
#        'mupdf-tools' ???
)
checkdepends=('ttf-dejavu') # ttf-dejavu for make check
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860')

prepare() {
  cd "$pkgname"-$pkgver
  autoreconf -vfi
}

build() {
  cd "$pkgname"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  make
}

check() {
  cd "$pkgname"-$pkgver
  make check
}

package() {
  cd "$pkgname"-$pkgver
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
