# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=libunibreak
pkgver=6.0
pkgrel=1
pkgdesc="An implementation of the line breaking algorithm as described in Unicode 5.2.0 Standard Annex 14, Revision 24"
arch=("x86_64")
url="https://github.com/adah1972/libunibreak/"
license=("custom:zlib/libpng")
depends=('glibc')
replaces=('liblinebreak')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adah1972/libunibreak/archive/libunibreak_${pkgver//./_}.tar.gz")
sha256sums=('09e9d2f41e1179f9cb9aec60abe768bec66290037a6d35450d2dc002d4d85dff')

build() {
  cd "$srcdir/libunibreak-libunibreak_${pkgver//./_}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libunibreak-libunibreak_${pkgver//./_}"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib/*.a
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
