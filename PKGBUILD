# Maintainer: artist for Artix Linux

pkgname=equate
pkgver=0.1.1
pkgrel=1.1
pkgdesc="Calculator based on EFL"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('efl')
makedepends=('git')
source=("git+https://git.enlightenment.org/enlightenment/$pkgname.git")

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/$_pkgname/README"
  install -Dm644 README.edje "$pkgdir/usr/share/$_pkgname/README.edje"
# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
}

sha256sums=('SKIP')
