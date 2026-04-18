# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xattr
pkgver=1.2.0
pkgrel=1
pkgdesc='Python wrapper for extended filesystem attributes'
arch=('x86_64')
license=('MIT')
url='https://github.com/xattr/xattr'
depends=('python-cffi')
makedepends=('git' 'python-build' 'python-cffi' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/xattr/xattr.git#tag=v$pkgver")
sha512sums=('befb86d0e0acdd80d276db6820b8e037ba6b003d7b2da714a6490290c468b04195e91591fc7f44bd477380a060f2f756a53cfb5e0150bbf7cbaab950690c2b7f')

build() {
  cd xattr
  python -m build --wheel --no-isolation
}

check() {
  # Build env doesn't have permission for those xattrs
  cd xattr
  python -m venv --system-site-packages "$srcdir/pyvenv"
  "$srcdir/pyvenv/bin/python" -m installer dist/*.whl
  mkdir -p "$srcdir/testdir"
  cd "$srcdir/testdir"
  "$srcdir/pyvenv/bin/python" -m pytest "$srcdir/xattr/tests"
}

package() {
  cd xattr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
