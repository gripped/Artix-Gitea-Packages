# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.100.0
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/tiangolo/fastapi"
license=(MIT)
depends=(
  python
  python-anyio  # implicitly required for concurrency
  python-dirty-equals
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  # test dependencies
  python-aiosqlite
  python-anyio
  python-databases
  python-flask
  python-httpx
  python-peewee
  python-pytest
  python-sqlalchemy
  python-trio

  # optdepends
  python-email-validator
  python-itsdangerous
  python-jinja
  python-orjson
  python-python-multipart
  python-pyyaml
  python-ujson
  uvicorn

  # dev depends
  python-bcrypt
  python-cryptography
  python-jose
  python-passlib
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
  'python-ujson: for faster JSON parsing and UJSONResponse'
  'uvicorn: for Uvicorn as ASGI server'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('7be1d0557566bf5367d239ca10b8aa938db1cc2e444c5fe2a50fa32e4421649e432a8f2ac3e367b6786d577fc3f6c526990431c3b5206a0ed58fdfc4d0097c80')
b2sums=('37d2b89e875b2ddd4846301c41a0d6ecbf328e332170ff7320d55c6f54f43475057829daa19b6fd9810f42a8ada59fe4cd1acce0953307d774c4a3e64d891452')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    -p no:warnings
    --deselect tests/test_dependency_normal_exceptions.py::test_dependency_gets_exception
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
