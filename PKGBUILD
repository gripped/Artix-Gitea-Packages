# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xattr
pkgver=1.1.4
pkgrel=1
pkgdesc='Python wrapper for extended filesystem attributes'
arch=('x86_64')
license=('MIT')
url='https://github.com/xattr/xattr'
depends=('python-cffi')
makedepends=('git' 'python-build' 'python-cffi' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/xattr/xattr.git#tag=v$pkgver")
sha512sums=('022aadb4f3afb2ce40a13be65d7f55ed50d3151885a78a3ed0cbf17dd86669c5f4d6cd7d6cc06ddaa6e35deef2c9e9b8c6321d88c0d79b6ff90b223916fb9d44')

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
