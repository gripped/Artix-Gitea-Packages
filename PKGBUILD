# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
_pkgname=zope.testrunner
pkgver=7.0
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
sha512sums=('90ba773a90c30a24a1a32618a56a1a5344a76ca5e125f36bc8b86d4cc7e82eb0dc6dc0331ad1487c2602a72bfb3705799a67c3b3d217b36b0f1a0134148e44fd')

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
