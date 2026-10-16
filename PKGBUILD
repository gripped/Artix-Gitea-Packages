# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-bitarray
pkgver=3.12.1
pkgrel=1
pkgdesc="Efficient arrays of booleans for Python"
arch=(x86_64)
url="https://github.com/ilanschnell/bitarray"
license=(PSF-2.0)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('e8c8f8c8d612581d8638b135a882b9b59989187c7cd689214d7e1b992fc97aa2a8b00a1f9ba2bdcb775a5d4a79eeb395b08c05a656652799750609d81c390de0')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  local pytest_args=(
    --pyargs bitarray

    # Requires a free-threaded Python build
    --ignore-glob='*/test_free_threading.py'
  )
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest "${pytest_args[@]}"
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
