# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-backrefs
pkgver=8.1
pkgrel=1
pkgdesc="Wrapper around re or regex that adds additional back references"
arch=('any')
url="https://github.com/facelessuser/backrefs"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-regex'
)
optdepends=('python-regex: use regex instead of re')
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('db7ad742e2d14a574e0ae15b9594c730fbe69738a0dd684b63071bd2637aa360ee9a66b2f21863427131972626d3985aad4d8d8ae3845164ac82369767fc3031')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
