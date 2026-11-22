# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname=python-aiogram
pkgver=3.33.0
pkgrel=1
pkgdesc="A modern and fully asynchronous framework for Telegram Bot API"
arch=('any')
url="https://github.com/aiogram/aiogram"
license=('MIT')
depends=(
  'python'
  'python-aiofiles'
  'python-aiohttp'
  'python-certifi'
  'python-magic-filter'
  'python-pydantic'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'pifpaf'
  'python-aiohttp-socks'
  'python-aresponses'
  'python-babel'
  'python-cryptography'
  'python-motor'
  'python-pycryptodomex'
  'python-pymongo'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-lazy-fixture'
  'python-pytz'
  'python-redis'
  'valkey'
)
optdepends=(
  'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
  'python-ujson: ultra fast JSON encoder and decoder written in pure C'
  'python-rapidjson: extremely fast C++ JSON parser and serialization library'
  'python-emoji: emojize and demojize support'
  'python-redis: Redis storage support'
  'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
  'python-motor: MongoDB storage support'
  'python-babel: i18n support'
  'python-cryptography: webhook signature verification support'
  'python-pytest: aiogram.test pytest plugin support'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('7f069b1333bc0f69b444592ba328a13bd6317039beca1d7567fd93086d8cfb2d8af71ea8404f21da394d7381cd9fc70afaf10299929672728855a606a9b2eff5')

build() {
  cd aiogram
  python -m build --wheel --no-isolation
}

check() {
  cd aiogram
  # Subprocess tests run from temporary directories and require the installed wheel.
  python -m venv --system-site-packages --without-pip "$srcdir/test-env"
  "$srcdir/test-env/bin/python" -m installer dist/*.whl
  # shellcheck disable=2016
  # Preserve current fixture-scope behavior; upstream treats pytest-asyncio's warning as an error.
  PATH="$srcdir/test-env/bin:$PATH" pifpaf run redis -- bash -c 'python -m pytest --redis $PIFPAF_REDIS_URL -o asyncio_default_fixture_loop_scope=fixture-scope'
}

package() {
  cd aiogram
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
