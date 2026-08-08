# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=1.5.0
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
  python-pytest
  python-trio

  # optdepends
  python-itsdangerous
  python-jinja
  python-python-multipart
  python-pyyaml
  python-httpx2

  # not specified,but required
  python-sqlalchemy
)
optdepends=(
  'python-itsdangerous: for session middleware support'
  'python-jinja: for jinja templates'
  'python-python-multipart: for form parsing'
  'python-pyyaml: for schema generator'
  'python-httpx2: for test client'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('833989cdec055fc633985547e594b487f18b67e5855240c30cc38f2343ccfda6289514cc69897d83cf2b9ed62e220cbb37b17c9df769939fe3b0ec4a6ce92df0')
b2sums=('7f4b0bd09dee837b1a94c8bb8ec3d05f1135bc9582ad85ef1c0320806e6380e9912e10e5badf9f1ccf00b5655370395de5e61eb9de461ced02c645c3b0ad5cd6')

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
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
