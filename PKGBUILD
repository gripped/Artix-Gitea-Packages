# Maintainer: David Runge <dvzrv@archlinux.org>

_name=falcon
pkgname=python-falcon
pkgver=4.3.0
pkgrel=1
pkgdesc="Web API framework for fast and reliable microservices, proxies, and app backends"
arch=(x86_64)
url="https://falconframework.org/"
_url="https://github.com/falconry/falcon"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# TODO: add python-daphne
checkdepends=(
  gunicorn
  hypercorn
  python-aiofiles
  python-cbor2
  python-httpx
  python-jsonschema
  python-mimeparse
  python-msgpack
  python-mujson
  python-orjson
  python-pecan
  python-pytest
  python-pytest-asyncio
  python-pyyaml
  python-rapidjson
  python-requests
  python-testtools
  python-ujson
  python-websockets
  uvicorn
)
optdepends=(
  'python-bottle: for falcon-bench'
  'python-django: for falcon-bench'
  'python-flask: for falcon-bench'
  'python-jsonschema: for JSON schema validation'
  'python-msgpack: for MessagePackHandler'
  'python-pecan: for falcon-bench'
  'python-pprofile: for falcon-bench'
)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('50511d490bf235f3d5766b4e3e340161720ecdacd169b4959999764e346434ce0acb56479932751ec1fe17d0c9e8d022ba254370b20a871ca3ff5a5d4862d67f')
b2sums=('da73af59cd2274c0a07f0c95c6e5871e8a213e6c1c62dae4a98a343668779568618aa76ea5fd9e260f696ad6797524dcab363ce3ce22a91655c2d1561e7a90e2')

prepare() {
  cd $_name-$pkgver
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Tests against cbor2 6.x are not compatible with the test setup (yet): https://github.com/falconry/falcon/issues/2663
    --deselect 'tests/asgi/test_ws.py::test_media[True-True]'
    --deselect 'tests/asgi/test_ws.py::test_media[True-False]'
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
