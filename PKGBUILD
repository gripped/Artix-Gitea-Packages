# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.49.1
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
sha512sums=('efc540c9a4b6d04e6f426d1825a19a05a12f0b5f242e6acc64822e32db0d33cacfc71ffbeb2dca4b4e8f8898a4beee02a61a1cc1ad8b034215422f43de7103a1')
b2sums=('179b96363d6fbe7ce98d9be7ec22b94bb5363db049f26dc697d36419a7068fc2815d61c0a75f3bb4c29e3c7bd0556bb2e8769fba73b29f10ea03cecac6a90a1c')

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
