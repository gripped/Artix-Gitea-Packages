# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.49.0
pkgrel=1
pkgdesc='The little ASGI framework that shines'
arch=(any)
url="https://github.com/encode/starlette"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  python-aiosqlite
  python-databases
  python-pytest
  python-trio

  # optdepends
  python-itsdangerous
  python-jinja
  python-python-multipart
  python-pyyaml
  python-httpx

  # not specified,but required
  python-sqlalchemy
)
optdepends=(
  'python-itsdangerous: for session middleware support'
  'python-jinja: for jinja templates'
  'python-python-multipart: for form parsing'
  'python-pyyaml: for schema generator'
  'python-httpx: for test client'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('d0ed2830328153aca49695bab205acf8be2353b4a899be20cc17262234aa9e095c0f34bbcf324862053e10ac00ae6d183402221a35b37ba44145d27422edc87f')
b2sums=('279919ce422f4c8060999e8c744c5ee5f53f04efb2fffa72cd43d904528b26bc3be8d288a033c6febb056b9baa969fb25f32bf163b24ddf486c78c33a5d7de48')

prepare() {
  cd $_name-$pkgver
  # Ignore new warnings from python-anyio 4.4.0 making check() fails
  sed -i '/"error"/d' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect 'tests/test_routing.py::test_lifespan_with_on_events[asyncio]'
    --deselect 'tests/test_routing.py::test_lifespan_with_on_events[trio]'
    --deselect 'tests/middleware/test_wsgi.py::test_wsgi_post[asyncio]'
    --deselect 'tests/middleware/test_wsgi.py::test_wsgi_post[trio]'
    --deselect 'tests/test_requests.py::test_request_body[asyncio]'
    --deselect 'tests/test_requests.py::test_request_stream[asyncio]'
    --deselect 'tests/test_requests.py::test_request_body[trio]'
    --deselect 'tests/test_requests.py::test_request_stream[trio]'

  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
