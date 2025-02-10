# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
_pkgname=zope.testrunner
pkgver=6.7
pkgrel=1
pkgdesc="Zope testrunner script"
arch=('any')
url="https://github.com/zopefoundation/zope.testrunner"
license=('ZPL-2.1')
depends=(
  'python'
  'python-setuptools'
  'python-zope-exceptions'
  'python-zope-interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
# NOTE: Causes circular dependency as python-zope-testing depends on this
# package.
checkdepends=('python-zope-testing')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ee3464667786e21a2b86bb1723c3ac96e0d667d446aef51832301e7e714beca1065cc27a9bdf300d80f9e52059a91b69c5c94cfdb1c996ce6f9a3de80ebe1d59')

prepare() {
  cd $_pkgname-$pkgver
  # Remove test file with invalid Python syntax, breaks installation.
  rm src/zope/testrunner/tests/testrunner-ex/sample2/badsyntax.py
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/zope-testrunner -vc --test-path src/
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
