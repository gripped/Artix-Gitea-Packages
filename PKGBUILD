# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Adopted from aur/python-jsonpath-ng, original contributors:
# Contributor: Paul Irofti <paul@irofti.net>

pkgname=python-jsonpath-ng
pkgver=1.10.1
pkgrel=1
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pytest'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('07a9409ef400166c5e5bd38716047d8694424d890a93fa1959565cd13da602780b8ef86196327ab55ed2ea436a101974a95bc33cee37f0bc4fecab68235d1eb6')

build() {
  cd "${pkgname#python-}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Benchmarks require pytest-codspeed, which is not packaged
  test-env/bin/python -m pytest --ignore=tests/benchmarks
}

package() {
  cd "${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
