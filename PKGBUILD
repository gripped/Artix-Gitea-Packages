# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.21.2
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('e16884351866c87761bd4f3ff3d09ef6a6269ec7ee121eebaebe48ca591a96406807a5b7d74be05f8714af48fad97f3165c0018ccc9ce71b054ef7bec8137f9e')

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
