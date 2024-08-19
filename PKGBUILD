# Maintainer: artist for Artix Linux

pkgname=express
pkgver=0.0.1
pkgrel=2.1
pkgdesc="EFL based IRC Client"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('efl>=1.26.0')
makedepends=('git' 'meson>=0.40.0')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+http://git.enlightenment.org/enlightenment/$pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
  rm ${pkgdir}/usr/share/icons/express.png
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING" "COPYING-PLAIN"
}

