# Maintainer: artist for Artix Linux

pkgname=ecrire
pkgver=0.2.0
pkgrel=2.1
pkgdesc="Simple text editor based on EFL"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('efl>=1.26.0')
makedepends=('git' 'meson>=0.40.0')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
install=$pkgname.install
source=("git+http://git.enlightenment.org/enlightenment/$pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson --prefix /usr --buildtype release build
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
  rm ${pkgdir}/usr/share/icons/ecrire.{png,svg}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

