# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
_name=${pkgname#python-}
pkgver=75.2.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
url="https://pypi.org/project/setuptools/"
license=('PSF')
groups=(python-build-backend)
depends=(
  'python-jaraco.collections'
  'python-jaraco.functools'
  'python-jaraco.text'
  'python-more-itertools'
  'python-packaging'
  'python-platformdirs'
  'python-wheel'
)
makedepends=(
  'git'
  'python-setuptools'
)
checkdepends=(
  'python-build'
  'python-ini2toml'
  'python-jaraco.envs'
  'python-jaraco.path'
  'python-jaraco.test'
  'python-path'
  'python-pip'
  'python-pytest-home'
  'python-pytest-timeout'
  'python-tests'
  'python-tomli-w'
  'python-wheel'
)
provides=('python-distribute')
replaces=('python-distribute')
source=(
  "git+https://github.com/pypa/setuptools.git#tag=v$pkgver"
  build-no-isolation.patch
)
sha512sums=('b7284200451eff5afb1394701de5f3749b7b23a43c4fd859a59aeed0bb662b1a5c30ee120c0f8b15a1c3706561bd772d12b683bd08188969d06121fb5d53e074'
            '701b4364736344951d945df624f58973dfbca56eeda708aeed928df10f5598509e3acf87074ab30d84bb652fc8e307157184bfe43bb81ee83159966430c58e51')
#validpgpkeys=('CE380CF3044959B8F377DA03708E6CB181B4C47E') # Jason R. Coombs <jaraco@jaraco.com>

prepare() {
  cd "$_name"
  # Populate dependencies list for devendored deps
  sed '/^core =/,/]/!d' pyproject.toml > ../requirements.txt
  sed -i '1d;$d' ../requirements.txt
  sed -i '/^dependencies =/ {
r ../requirements.txt
s/^core =/dependencies =/
}' pyproject.toml

  # Keep validate-pyproject as it also includes the generated validations
  rm -r "$_name"/_vendor

  # Fix tests invoking python-build
  patch -p1 -i ../build-no-isolation.patch

  # Remove post-release tag since we are using stable tags
  sed -e '/tag_build = .post/d' \
      -e '/tag_date = 1/d' \
      -i setup.cfg
}

build() {
  export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

  cd "$_name"
  python setup.py build
}

check() { (
  # Workaround UTF-8 tests by setting LC_CTYPE
  export LC_CTYPE=en_US.UTF-8

  # https://github.com/pypa/setuptools/pull/810
  export PYTHONDONTWRITEBYTECODE=1

  cd "$_name"
  local pytest_args=(
    --verbose
    --ignore tools/finalize.py # jaraco.develop is not packaged
    --ignore tools/vendored.py # jaraco.packaging is not packaged
    # devendoring
    --deselect "$_name"/tests/test_"$_name".py::test_wheel_includes_vendored_metadata
    --deselect "$_name"/tests/test_virtualenv.py::test_no_missing_dependencies
    # system site packages
    --deselect "$_name"/tests/test_virtualenv.py::test_pip_upgrade_from_source
    # pytest-subprocess not packaged, fixture 'fp' not found
    --deselect "$_name"/tests/test_packageindex.py::TestPackageIndex
  )

  PYTHONPATH=build/lib python -m pytest "${pytest_args[@]}"
)}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$_name"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  rm "$pkgdir/$site_packages/$_name"/*.exe
}
