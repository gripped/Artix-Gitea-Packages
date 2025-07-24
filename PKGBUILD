# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=darkhttpd
pkgver=1.17
pkgrel=1
pkgdesc='A small and secure static webserver'
arch=('x86_64')
url='https://unix4lyfe.org/darkhttpd/'
license=('ISC')
depends=('glibc')
backup=('etc/conf.d/mimetypes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emikulic/darkhttpd/archive/v${pkgver}.tar.gz")
sha256sums=('4fee9927e2d8bb0a302f0dd62f9ff1e075748fa9f5162c9481a7a58b41462b56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install darkhttpd
  install -Dm0755 "$srcdir/$pkgname-$pkgver/darkhttpd" "$pkgdir/usr/bin/darkhttpd"

  # install systemd files
  install -dm0755 "$pkgdir"/etc/conf.d/
  touch "$pkgdir"/etc/conf.d/mimetypes

  # install license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' darkhttpd.c > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
