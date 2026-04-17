# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.8.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest-xdist')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('f184ecabc33fa24fcf37ee8bc382b8f14f40a1b78c2b703e985422dd4e4997416ed2c558c7235319ed9bc2eac50880d30e72d70314eb3c277f8e6104b362ec7a')

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
}
