# Maintainer: artist for Artix Linux

_pkgname=Moksha-menu
pkgname=moksha-menu
pkgver=1.0
pkgrel=3
pkgdesc="Desktop menus for Moksha"
arch=('any')
url="https://github.com/BodhiDev"
license=('GPL2')
makedepends=('git' 'intltool')
source=("git+${url}/${_pkgname}.git")
build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure  --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make -j1 DESTDIR="$pkgdir/" install
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  install -Dm644 NEWS "$pkgdir/usr/share/$pkgname/NEWS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/$pkgname/ChangeLog"
  install -Dm644 AUTHORS "$pkgdir/usr/share/$pkgname/AUTHORS"
}
sha256sums=('SKIP')
