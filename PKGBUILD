# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.136.0
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/fastapi/fastapi"
license=(MIT)
depends=(
  python
  python-annotated-doc
  python-anyio  # implicitly required for concurrency
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing_extensions
)
makedepends=(
  python-build
  python-dirty-equals
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  # test dependencies
  python-aiosqlite
  python-a2wsgi
  python-anyio
  python-flask
  python-httpx
  python-inline-snapshot
  python-peewee
  python-pytest
  python-sqlalchemy
  python-sqlmodel
  python-trio
  python-typer

  # optdepends
  python-email-validator
  python-itsdangerous
  python-jinja
  python-orjson
  python-python-multipart
  python-pyyaml
  python-strawberry-graphql
  python-ujson
  uvicorn

  # dev depends
  python-argon2-cffi
  python-cryptography
  python-pyjwt
  python-pwdlib
)
optdepends=(
  'hypercorn: for Hypercorn as ASGI server'
  'python-email-validator: for email validation'
  'python-itsdangerous: for SessionMiddleware support'
  'python-jinja: for default starlette template configuration'
  'python-orjson: for ORJSONResponse'
  'python-python-multipart: for form parsing support'
  'python-pyyaml: for starlette SchemaGenerator support'
  'python-httpx: for TestClient support'
  'python-strawberry-graphql: for GraphQL support'
  'python-ujson: for faster JSON parsing and UJSONResponse'
  'uvicorn: for Uvicorn as ASGI server'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('99f4465e96737e239687e98d51017a9ab62ed04934f98866ede1c69f8b5e9324c15653c148b68ced24ad89160d7431bfb6c3e14715d6fb3d12e289a56c1199aa')
b2sums=('7f8cbbea51221dbd0dc3193862f15c5aa3f3e78e7536a539c2c1ae4406e07b44fc4630dc4af35e68c3891a1e96693446eb12884c625c9309ae21546183c739a2')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
  sed -i '/"error"/d' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # This test wants to run fastapi cli from $PATH
    --deselect tests/test_fastapi_cli.py::test_fastapi_cli
  )

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
