# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-multidict
pkgver=6.5.1
pkgrel=1
pkgdesc='Asyncio-based multidict implementation for Python'
arch=('x86_64')
url='https://github.com/aio-libs/multidict'
license=('Apache-2.0')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-objgraph'
  'python-perf'
  'python-psutil'
  'python-pytest'
  'python-pytest-codspeed'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7fa411d12b492a2f567c0228e5822200e711a9e1c221595f2a6d40ffaa2c870dfeb9d12f421495e66c2c95673efd7c3275cef9810b1404e7e6afccaac1b6c182')
b2sums=('4c438450a49e7f5a8b5ac49ff124e018aa7e62642ff39ec8b92f6c24e776f9c6ffbaa3d3e8ecafaeff96c8164291d52539a94eb6e286642c4332d3636f691a06')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  cd tests
  ../test-env/bin/python -m pytest -v --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
