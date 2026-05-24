# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.152.9
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
license=(MPL-2.0)
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
  python-django
  python-dpcontracts
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
  python-scipy
  python-syrupy
  python-watchdog
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
  'python-watchdog: for tracking file system events'
)
source=("$pkgname::git+$_url#tag=hypothesis-python-$pkgver")
sha512sums=('dc592756188a93819e405bdf777bd43827b0f407b838fd6095135dd9ad149c8f0c7e870644736ee78a7a5f595b8fc11f12e07c0d2d4c86d09968520f7c8f16a5')
b2sums=('03d61e9a8a75ac43fafaeeda1af4db0bba8ebf36e4ff9878a94e4d33f59efeaa32c12ce625f79ef37c6e6ff5dcafd45e6aac88eeb217315a6a1d9f373c005383')

prepare() {
  cd $pkgname/hypothesis-python
  # Fix test failing due to trailing space diff
  sed -i 's/def      /def/' tests/cover/test_reflection.py
}

build() {
  cd $pkgname/hypothesis-python
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname/hypothesis-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  local pytest_options=(
    -vv
    # ignore deprecation warnings
    -W=ignore::DeprecationWarning
    # Run tests in parallel, takes forever otherwise
    -n auto
    # Keep rootdir at hypothesis-python/ so --deselect node ids resolve
    --rootdir=.
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore=tests/crosshair/test_conformance.py
    --ignore=tests/crosshair/test_crosshair.py
    # Fails with AssertionError for some reason
    --ignore=tests/nocover/test_scrutineer.py
    # fails with mismatch for some reason
    --deselect 'tests/snapshots/test_always_failing.py::test_always_failing[emails]'

  )
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest \
    "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
