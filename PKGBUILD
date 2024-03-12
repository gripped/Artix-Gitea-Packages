# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.9.1
pkgrel=1
pkgdesc='A tool for running Jupyter Notebooks in different execution contexts'
arch=(any)
url='https://github.com/jupyter/nbclient'
license=(BSD-3-Clause)
depends=(jupyter-nbformat
         python
         python-jupyter-client
         python-jupyter-core
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(jupyter-nbconvert
              python-flaky
              python-ipywidgets
              python-pytest-asyncio
              python-testpath
              python-xmltodict)
source=(https://github.com/jupyter/nbclient/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ad1d37f2ce2b13dc1450f884cf29888f6a8e969493638a64ca832dbe4504f0ec')

build() {
  cd nbclient-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbclient-$pkgver
  pytest -v
}

package() {
  cd nbclient-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
