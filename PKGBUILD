# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.98.17
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
source=($_name-$_version.tar.gz::$_url/archive/$_version.tar.gz)
sha512sums=('749fb572b7239dafab5af649ec0eb8fa0071f35dd394c1b356ff2042abbe6e469ca8d7c32619d44cefbc3d7aa8fd31a81d95f772e826578261fdf97c792bdb57')
b2sums=('3c26f8c696bc4a62b9ada8e45dd3053879e15c3dfde25caf8239be5e89f6267df342d9c3039b6c2cbb8125ade365b89c5f4d1de5f79e65ddc0808227fe37ec40')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

check() {
  local pytest_options=(
    -vv
    # disable failing tests: https://github.com/HypothesisWorks/hypothesis/issues/3704
    # for some reason --deselect does not work, so ignoring whole file
    --ignore tests/patching/test_patching.py
    --ignore tests/ghostwriter/test_expected_output.py
    --ignore tests/cover/test_error_in_draw.py
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$_version/$_alt_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" tests/
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer -d "$pkgdir" dist/*.whl
}
