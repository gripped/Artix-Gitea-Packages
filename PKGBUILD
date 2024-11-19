# Maintainer: artist for Artix Linux

pkgname=evisum
pkgver=0.6.1
pkgrel=3
pkgdesc="Process monitor like top based on EFL"
arch=('x86_64')
url="https://www.enlightenment.org/about-evisum"
license=('BSD')
depends=('efl')
makedepends=('meson' 'ninja' 'gcc' 'binutils')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")

build() {
  cd ${pkgname}-${pkgver}
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  rm -rf build
  meson --prefix=/usr \
  . build
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
sha256sums=('832f20b8de13e290890810267cf41ed84cbb0c84e2e20a14f6783632612dadb9')
