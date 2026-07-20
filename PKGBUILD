# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=3.2.0
pkgrel=1
pkgdesc="ULID implementation for Python"
arch=(any)
url="https://github.com/mdomke/python-ulid"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pydantic
  python-pytest
)
optdepends=('python-pydantic: for pydantic integration')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('8e7a5065d42eb413d6395a629c15f8a579402cab63b27a51b9447fbd613d7b6011184cf30d85aa4b14c667ac67da7600e3c1b727797ef27714b2de68cdda6b70')
b2sums=('638e285e2672c3be1d0433f4384f982fe3b572d7098fd21002aecc7f096c4430bbfca596d5849b3f1702898d87655ff295a8f97ebccb0788118c722281eb1d84')

build() {
  cd $pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
