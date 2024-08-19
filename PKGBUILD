# Maintainer: artist for Artix Linux

pkgname=espionage
pkgver=1.1
pkgrel=2
pkgdesc="D-Bus inspector written in python that use the EFL"
arch=('any')
url="http://www.enlightenment.org/"
license=('BSD')
depends=('python-efl' 'python-distutils-extra')
makedepends=('git')
conflicts=("$pkgname-git")
options=('lto')
source=("git+https://git.enlightenment.org/enlightenment/$pkgname.git")
sha256sums=('SKIP')

package(){
  cd "$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" ChangeLog README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
