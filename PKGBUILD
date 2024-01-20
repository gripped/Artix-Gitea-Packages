# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=darkhttpd
pkgver=1.15
pkgrel=1
pkgdesc="A small and secure static webserver"
arch=('x86_64')
url="https://unix4lyfe.org/darkhttpd/"
license=('BSD')
backup=('etc/conf.d/mimetypes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emikulic/darkhttpd/archive/v${pkgver}.tar.gz")
sha256sums=('ea48cedafbf43186f4a8d1afc99b33b671adee99519658446022e6f63bd9eda9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install darkhttpd
  install -Dm755 "$srcdir/$pkgname-$pkgver/darkhttpd" "$pkgdir/usr/bin/darkhttpd"

  install -dm0755 "$pkgdir"/etc/conf.d/
  touch "$pkgdir"/etc/conf.d/mimetypes

  # install license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' darkhttpd.c > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
