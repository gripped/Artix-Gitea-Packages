# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbformat
pkgver=5.10.0
pkgrel=1
pkgdesc='The base implementation of the Jupyter Notebook format and Python APIs for working with notebooks'
arch=(any)
url='https://pypi.python.org/pypi/nbformat'
license=(BSD-3-Clause)
depends=(python
         python-fastjsonschema
         python-jsonschema
         python-jupyter-core
         python-traitlets)
makedepends=(python-build
             python-installer
             python-hatch-nodejs-version)
checkdepends=(python-pep440
              python-pytest
              python-testpath)
source=(https://github.com/jupyter/nbformat/archive/v$pkgver/nbformat-$pkgver.tar.gz)
sha256sums=('e02c498712772d4daab839719eae168841a38e800c70e068c91703312ddd6602')

build() {
  cd nbformat-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd nbformat-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd nbformat-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
