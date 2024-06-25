# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.8.30
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(gcc-libs
         glibc
         python)
makedepends=(git
             python-build
             python-installer
             python-maturin)
checkdepends=(python-anyio
              python-objsize
              python-pydantic
              python-pytest
              python-trio
              python-y-py)
source=(git+https://github.com/jupyter-server/pycrdt#tag=v$pkgver)
sha256sums=('c281810f7b9c0e46619663dee5258d2a12b8e9b5ce86c8b354f151ff7e83752c')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
