# Maintainer: artist for Artix Linux

pkgname=python-efl
pkgver=0.4.1.1261.gc8d7bdd
pkgrel=1.1
pkgdesc="Python bindings for the Enlightenment Foundation Libraries"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=("efl>=${pkgver%a*.*}" "python-dbus")
makedepends=('git' 'cython0' 'python' 'python-setuptools')
provides=("${pkgname}=$pkgver")
conflicts=("${pkgname-git}")
source=("git+https://git.enlightenment.org/enlightenment/$pkgname.git/")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  local v_ver="0.4.1"
  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
#sed -i -e 's|0.99.99|99.99.99|' setup.py
  cp README.md README

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/${pkgname%-*}/"
  install -m644 -t "$pkgdir/usr/share/doc/${pkgname%-*}/" AUTHORS README ChangeLog
}
