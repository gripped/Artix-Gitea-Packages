# Maintainer: David Runge <dvzrv@archlinux.org>

_name=importlib_resources
pkgname=python-importlib_resources
pkgver=6.1.3
pkgrel=1
pkgdesc="Design and implementation for a planned importlib.resources"
arch=(any)
url="https://github.com/python/importlib_resources"
license=(Apache-2.0)
depends=(
  python
  python-zipp
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-jaraco.collections
  python-pytest
  python-pytest-enabler
  python-tests
)
provides=(python-importlib-resources)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5e4d45121102b3dd9bc621097b4c5502c7033c06aa0221dd77e4cd08840edc5ff35cb2bd000ba3d000fda8a8f285577ce451a01294924eabd18e6ac5235648be')
b2sums=('1e274329b899482809139249f614b44b4bad4dd2003d5b14364342c7b8b342cb7ce3d77a49e3fcfe3359ea88e4945f08232d5fbfd3331d4e228fc32bc94113e3')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD:$PYTHONPATH"
  pytest -vv

}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove tests
  rm -frv "$pkgdir/$_site_packages/$_name/tests/"
}
