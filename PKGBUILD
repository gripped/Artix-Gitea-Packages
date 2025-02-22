# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-autorefs
_pkgname=autorefs
pkgver=1.3.1
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
  python-pygments
  python-pymdown-extensions
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c86fd428e43b44829e10f60c233353f12842564852fed5095cbe177e3607079c')

build() {
  cd $_pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
