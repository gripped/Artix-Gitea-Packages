# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-xkbcommon
pkgver=0.8
pkgrel=3
pkgdesc="Python bindings for libxkbcommon using cffi"
arch=(x86_64)
url="https://github.com/sde1000/python-xkbcommon"
license=(MIT)
depends=(
  glibc
  python
  python-cffi
  libxkbcommon
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('ae2640ef89e7ace0468e970762c7be4d3f608701f1abea10174f274c622db28a6e6323cdc5bbbbaaa1065d4c4ddf9f67b75d4c34bb2e9a0bb6260778b15a330a')
b2sums=('0d2a649e3fee8baa9345ddca97dc7c77b5d9e10d7ca90cbb29bcc3531f4bba3deee39e610e147054e956310506fb79ebb43c85955b787e55046d67c12b851026')

build() {
  cd $pkgname-$pkgver
  python ${pkgname#python-}/ffi_build.py
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -v
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
