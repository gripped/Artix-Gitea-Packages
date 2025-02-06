# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.124.9
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
  git
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
source=("$pkgname::git+$_url#tag=hypothesis-python-$pkgver")
sha512sums=('2d8a2e25bbc5c37d92b472877d652cb4ebc94f14e0a1a2fac500e6664012d38493e69eb7bc8defe630807401c11cea00383ad9dad5248f725584a2f0464af531')
b2sums=('40cab81645daf03cd06fd2e455e03da091c6e7600c150c8c76d6f9154e1b17b2e2f4f4fe299e338cf88ec03ae005461a6f7aa9a4c0e665c88359becb6c6a0492')

prepare() {
  cd $pkgname/hypothesis-python
  # Fix test failing due to trailing comma diff
  sed -i 's/],/]/' tests/ghostwriter/recorded/union_sequence_parameter.txt
}

build() {
  cd $pkgname/hypothesis-python
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

  cd $pkgname/hypothesis-python
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
