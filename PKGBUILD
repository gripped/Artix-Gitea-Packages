# Maintainer: artist for Artix Linux

pkgname=terminology
pkgver=1.14.0
pkgrel=1
pkgdesc="EFL based terminal emulator"
arch=('x86_64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl>=1.26' 'openssl-1.1' 'libsndfile' 'libpulse')
makedepends=('git' 'meson' 'cmake')
source=("git+http://git.enlightenment.org/enlightenment/$pkgname.git#commit=4c3f4fbb390caf8636c470450fd70209d429720e")

sha256sums=('4e8be8539d95ba94683594ad85ad335360c6d931371b3ea0c9e520fb5b0a0a26')

build() {
  cd "$pkgname"
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package(){
  cd "$pkgname"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
