# Maintainer: artist for Artix Linux

pkgname=rage
pkgver=0.4.0
pkgrel=2
pkgdesc="Video Player based on EFL"
arch=('x86_64')
url="https://www.enlightenment.org/about-rage"
license=('BSD')
depends=('efl>=1.26.0')
makedepends=('git' 'meson>=0.47.0' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot')
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
# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
