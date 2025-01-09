# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic
pkgname=python-$_name
# WARNING: upstream pins pydantic-core down to the patch-level and using other versions breaks tests! only update in lock-step with python-pydantic-core!
pkgver=2.10.5
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints'
arch=(any)
url="https://github.com/pydantic/pydantic"
license=(MIT)
depends=(
  python
  python-annotated-types
  python-pydantic-core
  python-typing_extensions
)
makedepends=(
  cython
  python-build
  python-installer
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-wheel
)
checkdepends=(
  python-ansi2html
  python-cloudpickle
  python-dirty-equals
  python-email-validator
  python-faker
  python-greenlet
  python-hypothesis
  python-jsonschema
  python-packaging
  python-pygments
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-pretty
  python-pytz
  python-sqlalchemy
)
optdepends=(
  'mypy: for type validation with mypy'
  'python-dotenv: for .env file support'
  'python-email-validator: for email validation'
  'python-hypothesis: for hypothesis plugin when using legacy v1'
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('6cb11cd0bae1c0aa918d99e927da8a47d9a749ad0c558bcfb78b9e766cb9cee6255673ed922cdb57696b3af621b127410729a59ba080170bf69f2227681d32dc')
b2sums=('507ac4f98a586df5539d006297b74ee397c5045e3c6cf21222b0d0be644ed9f5fdddeea582e2daed6ddabb799187eedbce6cddb79fa39b471c7d47e8a3f9a9bf')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/test_docs.py  # we are not interested in code formatting
    --deselect tests/test_types.py::test_string_fails
    --deselect 'tests/test_networks.py::test_address_invalid[foobar-An email address must have an @-sign.]'
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
