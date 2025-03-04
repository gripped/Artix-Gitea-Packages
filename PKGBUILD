# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-autorefs
_pkgname=autorefs
pkgver=1.4.0
pkgrel=1
pkgdesc="Automatically link across pages in MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/autorefs"
license=(ISC)
depends=(
  mkdocs
  python
  python-markdown
  python-markupsafe
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  mkdocs-material
  python-pygments
  python-pymdown-extensions
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d9a854660bd18067355f2bf55e53076f072111d411f62b2e38cb69e2134848b0')

build() {
  cd $_pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # tests/test_api.py requires griffe, which is not in repos
  test-env/bin/python -m pytest \
    --ignore tests/test_api.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
