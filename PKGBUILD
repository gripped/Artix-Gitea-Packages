# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: gDD (usrgdd | gmail)
# Contributor: cantabile

pkgname=convertlit
pkgver=1.8
pkgrel=12
pkgdesc='An extractor/converter for .LIT eBooks'
arch=(x86_64)
url='http://www.convertlit.com/'
license=(GPL-2.0-or-later)
depends=(glibc
         libtommath)
source=(http://www.convertlit.com/clit18src.zip
        Wformat-security.patch)
sha256sums=('d70a85f5b945104340d56f48ec17bcf544e3bb3c35b1b3d58d230be699e557ba'
            '7514b97fc593ca79aa517dd70d2e7c8dadd6e0223892ce38ff1deda1d15a693d')

prepare() {
# Fix build with -Wformat-security (Gentoo)
  patch -p1 < Wformat-security.patch
# Link to shared libtommath and use system LDFLAGS
  sed -e 's|../libtommath-0.30/libtommath.a|/usr/lib/libtommath.so ${LDFLAGS}|' -i clit18/Makefile
# Use system CFLAGS
  sed -e 's|CFLAGS=-O3 -Wall|CFLAGS+=|' -i lib/Makefile
  sed -e 's|CFLAGS=-funsigned-char -Wall -O2|CFLAGS+=|' -i clit18/Makefile
}

build() {
  export CFLAGS+=" -Wno-implicit-function-declaration"

  cd lib && make
  cd ../clit18 && make
}

package() {
  cd clit18
  install -Dm755 clit -t "$pkgdir"/usr/bin
}
