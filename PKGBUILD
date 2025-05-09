# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.21.1
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('0296b37a4b2e62e711de8908e535d2def596f7ec7de5fd4e03ba3b610ee0859cf239fc53c94046f0bfcf6d3935eb45f7fae726bf9846e5ebf3fb22bc02714fe7')

build() {
  cd validators
  python -m build -nw
}

check() {
  cd validators
  python -m pytest
}

package() {
  cd validators
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
