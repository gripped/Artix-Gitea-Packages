# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-httpx-aiohttp
pkgver=0.1.6
pkgrel=1
pkgdesc='aiohttp-powered httpx client'
arch=(any)
url=https://github.com/karpetrosyan/httpx-aiohttp
license=(BSD-3-Clause)
depends=(
  python
  python-aiohttp
  python-httpx
)
makedepends=(
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-brotli
  python-brotlicffi
  python-chardet
  python-h2
  python-pytest
  python-pytest-asyncio
  python-pytest-trio
  python-trio
  python-trustme
  python-zstandard
  uvicorn
)
source=(
  "git+$url.git#tag=$pkgver"
  "git+https://github.com/encode/httpx.git#tag=0.28.1"
  "uvicorn-test-server-use-h11.diff"
)
b2sums=('42abf64362a8d0e19b9e7e25ad873143b44ed2d422fa70c5695929818b323d3ff0d00d258a45b9d2eb9348aeb44e015a10ad0aafd3b7cf3f19bfb542ac0ad1f4'
        'aa0786b725741ada9126b3a352414444d3c7cf71bc220f6d6ee1be3c563199a1eae999848342714e44962f8f9ed12ccafe5a06aa80ecb8c6ba5af75a5722055b'
        'f7fc5aa67d59dfbf544ea2668a5df6449d1cb30f5adf1433d92ebbc0fd10d46fec592f1befe829e126d72240666b9c3ea1f69a9f2cca6f3f4e135a7e454be25d')

prepare() {
  cd "$srcdir/httpx"
  # Fixes/patches from python-httpx:prepare():
  patch -Np1 -i ../uvicorn-test-server-use-h11.diff
  sed -i '/"error",/d' pyproject.toml

  cd "$srcdir/${pkgname#python-}"
  rm -vr tests/httpx/
  ln -vs "$srcdir/httpx" tests/httpx
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python scripts/run_tests.py \
    -k 'not [trio]' \
    --deselect tests/client/test_async_client.py::test_get_invalid_url \
    --deselect tests/client/test_proxies.py::test_proxies_environ \
    --deselect tests/client/test_proxies.py::test_socks_proxy \
    --deselect tests/test_main.py \
    --deselect tests/test_timeouts.py
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
