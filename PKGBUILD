# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.33.0
pkgrel=1
epoch=2
pkgdesc="Core validation logic for pydantic written in rust "
arch=(x86_64)
url="https://github.com/pydantic/pydantic-core"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-dirty-equals
  python-hypothesis
  python-inline-snapshot
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-timeout
  python-pytest-run-parallel
)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5c5ec0dfe19368d095ab16373cba099f661454776483b7112412edb0d2052ecce51ec582e95e33a570533276f116ccb0c69d97a1d228612e07bf181c69046c2a')
b2sums=('bbc5f798b7caa2bdfb39a380163a0d7c0ef69a97828d4c6952f4314495fa5cc472bfb78147a31aee7922a04a5afbe04e5a93287d6807afec874ecb58bfda64fb')

prepare() {
  # we don't support version pinning
  sed -e 's/,!=4.7.0//g' -i $_name-$pkgver/pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  HYPOTHESIS_PROFILE=slow pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
