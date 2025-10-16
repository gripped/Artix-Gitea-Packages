# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-h5netcdf
pkgver=1.7.0
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/h5netcdf/h5netcdf"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-h5py'
  'python-numpy'
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-netcdf4'
  'python-pytest'
)
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-exclude-tests.patch"
)
sha256sums=('e99c5d741b780ed03cdb46069a84a2108b34de4ea21dce49624d75ee813835fa'
            '9d8580e5fed17e7ff8f1032d28ca0e307eeec2fc979f13e9017540e66e402695')

prepare() {
  cd ${pkgname#python-}-$pkgver
  patch -Np1 < ../$pkgname-exclude-tests.patch
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
