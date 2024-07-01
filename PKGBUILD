# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=8.4.1
pkgrel=1
pkgdesc='Retry code until it succeeeds'
arch=('any')
license=('Apache-2.0')
url='https://github.com/jd/tenacity'
depends=('python')
optdepends=('python-tornado: for Tornado coroutines support')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-tornado' 'python-trio' 'python-typeguard')
source=("git+https://github.com/jd/tenacity.git#tag=$pkgver")
sha512sums=('b71ed641325eb338247994374fe7cebd4524a9aaf37aee68ff2eecf01b3d3ef316002753397539ca243efdb054139f7b00f083ec1a9fb07c140066c819a39430')

build() {
  cd tenacity
  python -m build --wheel --no-isolation
}

check() {
  cd tenacity
  pytest
}

package() {
  cd tenacity
  python -m installer --destdir="$pkgdir" dist/*.whl
}
