# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-plette
pkgver=2.2.1
pkgrel=1
pkgdesc="Structured Pipfile and Pipfile.lock models"
url="https://github.com/sarugaku/plette"
license=('ISC')
arch=('any')
depends=('python-tomlkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-cerberus')
source=("git+https://github.com/sarugaku/plette.git#tag=v$pkgver")
sha512sums=('3cc9d4a3cf1bcfdff5f4ca657b63199a875b7d20a01f9ac83ae392a76f1e097d8fdff21b99e3148352a19e733fdab2b81d0665ddf752d9f1a2ce010e91dd73b6')

build() {
  cd plette
  python -m build -nw
}

check() {
  cd plette
  python -m venv .venv --system-site-packages
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest
}

package() {
  cd plette
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
