# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ignore-flaky
pkgver=2.2.0
pkgrel=1
pkgdesc="Ignore failures from flaky tests (pytest plugin)"
arch=('any')
license=('MIT')
url="https://github.com/coherent-oss/pytest-ignore-flaky/"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/coherent-oss/pytest-ignore-flaky.git#tag=$pkgver")
sha512sums=('2138a4c1c379cd8a3d3b5ea40d270b5040ea53bf2ae735efb2dffce5165801c1032d8e2866932b0e121e1ba95a453a9336bfa6b2018e8a28ba15c0c9b3c9882e')

build() {
  cd pytest-ignore-flaky
  python -m build -nw
}

check() {
  cd pytest-ignore-flaky
  python -m venv --system-site-packages venv
  venv/bin/python -m installer dist/*.whl
  venv/bin/python -m pytest
}

package() {
  cd pytest-ignore-flaky
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
