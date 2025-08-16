# Maintainer: artist for Artix Linux

pkgname=ephoto
pkgver=1.6.7
pkgrel=1
pkgdesc="A light image viewer based on EFL"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl>=1.26.0')
makedepends=('git' 'meson>=0.47.0')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+https://github.com/rbtylee/ephoto.git")
sha256sums=('SKIP')

build() {
  cd $pkgname
  rm -rf build
  artix-meson $@ . build \
  --prefix=/usr \
  --buildtype=release \
  --default-library=shared \
  --optimization=3

  meson compile -C build
}

check() {
  cd $pkgname
  meson test -C build
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" TODO README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
