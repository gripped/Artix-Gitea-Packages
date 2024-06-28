# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=8.4.0
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
sha512sums=('a34be009aefcf5fbc7bd06fc1c4e045c0891bdd29eac1b66d8ef9ace7387062425e9cf2220cbfc7cf8953d07470b5b4ffab6d04ee3bb56da347f134b7021e75f')

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
