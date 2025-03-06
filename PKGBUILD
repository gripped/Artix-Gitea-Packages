# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
_pkgname=zope.testrunner
pkgver=7.1
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
sha512sums=('62cc531616b24f9cdb3ec7c350e59b675b394c9dc035225a8ca6088fb6ca3f8033402bef93374e3cacda945d6eb4bf604b803e981e42dd3a4c6ab7b65678226e')

prepare() {
  cd $_pkgname-$pkgver
  # Remove test file with invalid Python syntax, breaks installation.
  rm src/zope/testrunner/tests/testrunner-ex/sample2/badsyntax.py
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
