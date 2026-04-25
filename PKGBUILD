# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.8.3
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest-xdist')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('c0a22872354ac800652c4e608fb673b83c5b876796192a11b83a0e8543187ba311539ec3270a0e847a1ab1fa3b843f4a3f712f876c5fe8beb68072966fdbf3fa')

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
