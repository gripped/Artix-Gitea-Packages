# Maintainer: artist for Artix Linux

pkgname=entice
pkgver=0.0.1
pkgrel=2
pkgdesc="Video Player based on EFL"
arch=('x86_64')
url="https://www.enlightenment.org/about-entice"
license=('BSD')
depends=('efl')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'libexif')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+https://github.com/vtorri/$pkgname.git")
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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS LICENSE
}
