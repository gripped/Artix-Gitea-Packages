# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.1.2
pkgrel=1
pkgdesc="Python helper for Semantic Versioning"
url="https://github.com/python-semver/python-semver"
license=('BSD-3-Clause')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-semver/python-semver.git#tag=$pkgver")
sha512sums=('1cc4f64e8042bb71aaf402566d43e01e56d7f0cf053b0421745b17a5da1a1463521046725599c881eafe308f9240194566b2c4e3865381f236aa80dae0dbb58c')

build() {
  cd python-semver
  python -m build -nw
}

check() {
  cd python-semver
  pytest -o addopts=''
}

package() {
  cd python-semver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
