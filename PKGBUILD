# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.50.0
pkgrel=1
epoch=3
pkgdesc="Core validation logic for pydantic written in rust "
arch=(x86_64)
url="https://github.com/pydantic/pydantic-core"
license=(MIT)
depends=(
  glibc
  libgcc
  python
  python-typing-inspection
  python-typing_extensions
)
makedepends=(
  git
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
  python-pytest-run-parallel
  python-pytest-timeout
)
options=(!lto)
source=(
    "pydantic::git+https://github.com/pydantic/pydantic.git#tag=core-v${pkgver}"
)

sha512sums=('bc658d00a821cf1eff79a00169dba3a833c2eaacbed43be2afa172b9300823277a03aa7ac553a49c423e58eff189cc3489ec9a6e692d0dab0b116c155637297d')
b2sums=('9787c8d3ed80348ce27e0327d62e4d5179c2236b77ee35e61f1c60729591dd8ea457577f528cb834b66e59833811a5358813d0a84b2388f1259f821657da1cd5')

build() {
  cd "pydantic/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
    --ignore tests/test_tzinfo.py  # requires python-pydantic
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "pydantic/$_name"
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  HYPOTHESIS_PROFILE=slow pytest "${pytest_options[@]}"
}

package() {
  cd "pydantic/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
