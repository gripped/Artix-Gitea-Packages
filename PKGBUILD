# Maintainer: artist for Artix Linux

pkgname=evisum
pkgver=0.6.0
pkgrel=2
pkgdesc="Process monitor like top based on EFL"
arch=('x86_64')
url="https://www.enlightenment.org/about-evisum"
license=('BSD')
depends=('efl')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+https://git.enlightenment.org/enlightenment/$pkgname.git")
sha256sums=('SKIP')

build() {
  cd $pkgname
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  rm -rf build
  meson --prefix=/usr \
  . build
  ninja -C build
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
