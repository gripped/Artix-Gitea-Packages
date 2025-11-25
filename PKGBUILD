# Maintainer: artist for Artix Linux

pkgname=terminology
pkgver=1.14.2
pkgrel=1
pkgdesc="EFL based terminal emulator"
arch=('x86_64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl>=1.26' 'openssl-1.1' 'libsndfile' 'libpulse')
makedepends=('git' 'meson' 'cmake')
source=("git+http://git.enlightenment.org/enlightenment/$pkgname.git#commit=915e60c0184495c56b5de38b5d35ec14031ebade")

sha256sums=('9d5d85350728134a57e5f91eb42c1b43bdd8b2b9dbf5e9dc8f372e7109129305')

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
