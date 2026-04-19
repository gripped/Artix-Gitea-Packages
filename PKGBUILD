# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=9.1.0
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('8a96cf8a2e3ff1cfc658ff3dd45f6c0d2de76c899475fbb90ff15669d6b248488d3116c0bff5dd2eaadfea7494fde6aed5d24c1e3dca5a0177abf674d7f90df7')

build() {
  cd sybil
  python -m build --wheel --no-isolation
}

check() {
  cd sybil
  python -m pytest
}

package() {
  cd sybil
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
