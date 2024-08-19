# Maintainer: artist for Artix Linux

pkgname=terminology
pkgver=1.13.1
pkgrel=3.1
pkgdesc="EFL based terminal emulator"
arch=('x86_64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl>=1.26' 'openssl-1.1' 'libsndfile' 'libpulse')
makedepends=('git' 'meson' 'cmake')
source=("git+http://git.enlightenment.org/enlightenment/$pkgname.git")

sha256sums=('SKIP')

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
