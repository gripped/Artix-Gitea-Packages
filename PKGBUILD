# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools-scm
pkgver=10.1.2
pkgrel=1
pkgdesc='Handles managing your python package versions in scm metadata'
arch=(any)
url=https://github.com/pypa/setuptools-scm
license=(MIT)
depends=(
  python
  python-packaging
  python-setuptools
  python-vcs-versioning
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  mercurial
  python-pip
  python-pytest
  python-pytest-timeout
  python-rich
)
checkdepends_riscv64=(
  libxml2
  libxslt
)
optdepends=(
  'python-rich: use rich as console log handler'
)
source=("$pkgname::git+$url.git#tag=setuptools-scm-v$pkgver")
sha512sums=('32489964a0ea4ba8428abbd527baec715bdff97a0a6fa8a97454fae0c9c577f19ae698206b7d0c675c45050eb4799b0c2780540931d250f8ea978b1deea4b93b')
b2sums=('dfa11689f45cc524bbcebf18c96f4cbc858f411bd7615fca971c9e4080a8721abef33946ccd73f19e9b9051df6477f177172ace03e92cd581a838d583482d1ea')

build() {
  cd "$pkgname/setuptools-scm"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname/setuptools-scm"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_opts=(
    -v
    -k 'not test_not_owner'
    --deselect testing_scm/test_basic_api.py::test_get_version_blank_tag_regex
    --deselect testing_scm/test_integration.py::test_setuptools_version_keyword_ensures_regex
  )

  pytest "${pytest_opts[@]}"
}

package() {
  cd "$pkgname/setuptools-scm"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
