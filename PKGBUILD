# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.10
pkgrel=1
pkgdesc='Asynchronous client for SQLite using AnyIO'
arch=(any)
url='https://github.com/davidbrochart/sqlite-anyio'
license=(MIT)
depends=(python
         python-anyio
         python-typing_extensions)
makedepends=(git
             python-build
             python-installer
             python-uv-build)
checkdepends=(python-pytest
              python-trio)
source=(git+https://github.com/davidbrochart/sqlite-anyio#tag=$pkgver)
sha256sums=('675aece49a212e431f180321758957003a4722411dbeec6a3ad333ea69e36c6d')

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
