# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=3.2.1
pkgrel=1
pkgdesc='Document structures for collaborative editing using Ypy'
arch=(any)
url='https://jupyter.org/'
license=(MIT)
depends=(python
         python-pycrdt)
makedepends=(git
             python-build
             python-hatch-nodejs-version
             python-hatchling
             python-installer)
checkdepends=(hypercorn
              python-pytest-asyncio
              python-websockets
              python-pycrdt-websocket)
source=(git+https://github.com/jupyter-server/jupyter_ydoc#tag=v$pkgver)
sha256sums=('282858093e0bc26cb463288e7ae614c04558398625f6e26efa529d34fd7b006a')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
#  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
