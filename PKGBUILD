# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.123.17
_version=$_alt_name-$pkgver
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
license=(MPL-2.0)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
depends=(
  python
  python-attrs
  python-sortedcontainers
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-black
  python-dpcontracts
  python-django
  python-faker
  python-fakeredis
  python-flaky
  python-lark-parser
  python-libcst
  python-numpy
  python-pandas
  python-pexpect
  python-pytest
  python-pytest-xdist
  python-pytz
)
optdepends=(
  'python-black: for CLI and ghostwriter'
  'python-click: for CLI'
  'python-dateutil: for date support'
  'python-django: for django module'
  'python-dpcontracts: for contracts support'
  'python-faker: for fakefactory and django module'
  'python-lark-parser: for lark module'
  'python-libcst: for codemods module'
  'python-numpy: for numpy module'
  'python-pandas: for pandas support'
  'python-pytest: for pytest module'
  'python-pytz: for datetime and django module'
  'python-redis: for redis support'
  'python-rich: for CLI'
)
source=("$_name-$_version.tar.gz::$_url/archive/$_version.tar.gz")
sha512sums=('73f2c2cd1bb9063d74448cfba0f85308398b52fcb0cd948a64b6396f698b914154a93b7afdf2b3c32a902f21f6a84996218572af700c35c518d9a41bbe6cae8f')
b2sums=('494c41299a646856050889e2093dae477386c76ac3e57576698178a65cfe4b3bb7a2cfe19204904ae0ca8d25cf8d347389c7eb76b7d8ac046067fc4b11bd509f')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

check() {
  local pytest_options=(
    -vv
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore tests/crosshair/test_crosshair.py
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$_version/$_alt_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" tests/
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
