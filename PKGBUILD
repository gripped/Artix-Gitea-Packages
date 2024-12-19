# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbclient
pkgver=0.10.1
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
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(jupyter-nbconvert
              python-flaky
              python-ipywidgets
              python-pytest-asyncio
              python-testpath
              python-xmltodict)
source=(git+https://github.com/jupyter/nbclient#tag=v$pkgver
        python-3.13.patch)
sha256sums=('b5832ad491b77af8688246fd6797190b41258d02589b732a2918ad155daaab93'
            '98b8c0ea25a02de822e1f3b1a96e677dac729e23397bf9674383e83f145ee5d5')

prepare() {
  cd nbclient
  patch -p1 -i ../python-3.13.patch
}

build() {
  cd nbclient
  python -m build --wheel --no-isolation
}

check() {
  cd nbclient
  pytest -v -k 'not test_cli_simple' # fails on build server
}

package() {
  cd nbclient
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
