# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_events
pkgname=python-jupyter-events
pkgver=0.10.0
pkgrel=3
pkgdesc='Configurable event system for Jupyter applications and extensions'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(python
         python-click
         python-json-logger
         python-jsonschema
         python-referencing
         python-rich
         python-traitlets
         python-yaml)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-asyncio
              python-pytest-console-scripts
              python-rfc3339-validator
              python-rfc3986-validator)
source=(git+https://github.com/jupyter/jupyter_events#tag=v$pkgver)
sha256sums=('72525739c61b23cd4d027bc00b0b8523e7836f169195b6525d9d4f1c100919fa')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  export PATH="$PWD/test-env/bin:$PATH"
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
  rm -fr test-env
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

