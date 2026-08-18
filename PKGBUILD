# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jake Leahy <jake (at) leahy (dot) dev

pkgname=pdfio
pkgver=1.6.4
pkgrel=2
pkgdesc="Simple C library for reading and writing PDF files"
arch=('x86_64')
url="https://github.com/michaelrsweet/pdfio"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libpng' 'zlib' 'glibc')
# libwebp is mentioned in INSTALL.md master branch but not yet to be found in configure/Make
# makedepends=('libwebp')
source=("pdfio-$pkgver.tar.gz::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz"
        "pdfio-$pkgver.tar.gz.sig::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz.sig")
sha256sums=('1b5e5e945f4fc214b55d575554c1aec11d7ba91b397cef92ffe877462155af06'
            'SKIP')
validpgpkeys=('9086C3CDC66C3F563CF8F405BE67C75EC81F3244') # Michael R Sweet <msweet@msweet.org>

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"

  # The build system uses only DSOFLAGS but not LDFLAGS to build some libraries.
  export DSOFLAGS=${LDFLAGS}
  
  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static
  #--help
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,NOTICE}
}
