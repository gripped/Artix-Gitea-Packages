# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.9.18
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
sha256sums=('816a9cef1d8730cec81e1f73a2e3a3691ac96a08bf23eafe3f6ee5e7f7661d36')

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
