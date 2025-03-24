# Maintainer: artist for Artix Linux

pkgname=evisum
pkgver=0.6.3
pkgrel=1
pkgdesc="Process monitor like top based on EFL"
arch=('x86_64')
url="https://www.enlightenment.org/about-evisum"
license=('BSD')
depends=('efl')
makedepends=('meson' 'ninja' 'gcc' 'binutils' 'git')
#source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
source=("${pkgname}-${pkgver}::git+https://git.enlightenment.org/enlightenment/evisum.git")

build() {
  cd ${pkgname}-${pkgver}
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  rm -rf build
  meson setup --prefix=/usr \
  . build
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING NEWS
}
sha256sums=('SKIP')
