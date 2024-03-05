# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.9.19
pkgrel=1
pkgdesc='A Python implementation of the JSON5 data format'
arch=(any)
url='https://pypi.org/project/json5/'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/dpranke/pyjson5/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8f068e0d49b62ca2577acb4ca757460489366e53fbdda503391204b542440b87')

build() {
  cd pyjson5-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyjson5-$pkgver
  pytest -v
}

package() {
  cd pyjson5-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
