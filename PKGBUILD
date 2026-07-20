# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=3.2.1
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
sha512sums=('32a4fea5d552f6f4bf8cc96dfd1d54fb1d9db0b08999b610927692639c003f7a289e1675f52febde5d7c42e80062d18c35856f3a70e67aba096a3677000b2172')
b2sums=('ccc78d5fa6a49c1475cef441e3df5b43f02a26978da02f2099a4c7f75060b15b5e1d15f3c9c325d78ac94bc53745f510f967de0cb36085547e08b0b3e7133060')

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
