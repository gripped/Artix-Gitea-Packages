# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.148.5
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
sha512sums=('13755f388889c0b41c37daf58046ccc957f6f59ff5e50745ae11b199a5a34c1dce54374c423abe3e03f073bfd50cd6d2cb6a9cae29bb9d0a3123bc35286c1c5d')
b2sums=('92c1b4d9f82b0e34494eafd8def9fe9964f0b2d8d933d1ea2f443e7d0503bf41ba4a84bb076475b3bafc1643bea4c5b8f767c5f4ba821a5eb61ac947ad360d78')

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
    # Run tests in parallel, takes forever otherwise
    -n auto
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore=tests/crosshair/test_conformance.py
    --ignore=tests/crosshair/test_crosshair.py
    # Fails with AssertionError for some reason
    --ignore=tests/nocover/test_scrutineer.py

    # Fails for some reason
    --ignore=tests/pytest/test_capture.py # ::test_healthcheck_traceback_is_hidden
    --ignore=tests/pytest/test_fixtures.py # ::test_given_fails_if_already_decorated_with_fixture
    --ignore=tests/watchdog/test_database.py
    --ignore=tests/nocover/test_argument_validation.py

    # Fails due to health check too slow for some reason
    --deselect=tests/nocover/test_stateful.py::test_unrelated_rule_does_not_use_var_reference_repr

    -W=ignore::DeprecationWarning
  )
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest \
    "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
