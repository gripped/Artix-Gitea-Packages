# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.127.1
pkgrel=2
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
  python-anyio
  python-flask
  python-httpx
  python-inline-snapshot
  python-peewee
  python-pytest
  python-sqlalchemy
  python-sqlmodel
  python-trio

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
sha512sums=('56c65a0afbb385a54e15cf5ca49ffab82ba7c8e6ed42977995aece41c4954893c8ca8ddd0d993c2ea35fd21c93fe3e638046dfc3dfb1b3bda1189e3c03edd8bd')
b2sums=('88d09703067a41185a066791ac058b106f6714820c4fb1f0cc795e0ce994032920cc93f49f9d54aabc7f58fb8c56166ec868c0f268e4ee678f86dbf1db16a3f5')

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
