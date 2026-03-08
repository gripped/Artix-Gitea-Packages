# Maintainer: David Runge <dvzrv@archlinux.org>

_name=binaryornot
pkgname=python-binaryornot
pkgver=0.5.0
pkgrel=1
pkgdesc="Ultra-lightweight pure Python package to check if a file is binary or text"
arch=(any)
url="https://github.com/binaryornot/binaryornot"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=(
  $_name-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
)
sha512sums=('33a8d7c9144cb85c74903e7354ba0daeae2af682c383bb0f5fe07baece958055134bb7c8ec3be8f4700a39a6a169e98a22f0ff1f02d72a6a71b1624c7c51833e')
b2sums=('46cbc2d98c0ed36e2264fdd7e7cd43df593a2699af7e29b26289dc4e6a0d54840083a2fd7d041b48e80e9530499311f8a4ab57800c89cdd31295940ce05af61b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  PYTHONPATH="src" python -m unittest discover -vs tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CODE_OF_CONDUCT,CONTRIBUTING,README,SECURITY}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
