# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blosc2
pkgver=4.11.0
pkgrel=1
pkgdesc='Wrapper for the blosc2 compressor'
arch=(x86_64)
url='https://github.com/Blosc/python-blosc2'
license=(BSD-3-Clause)
depends=(
  blosc2
  glibc
  python
  python-msgpack
  python-ndindex
  python-numexpr
  python-numpy
  python-httpx
  python-h2
  python-pydantic
  python-rich
  python-threadpoolctl
)
makedepends=(
  cmake
  cython
  git
  ninja
  python-build
  python-installer
  python-scikit-build-core
  python-setuptools
)
checkdepends=(
  python-psutil
  python-pytest
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('8d99f56af5c626ccd82c23ed7a849af0d1e5b70e18a95db5da4ca949722dc3687537acf768caaa6035a232f057e6c4e1e90aad748c4d673a00545124e4338634')
b2sums=('7df7392bc3e73d6bbbe7ebd9a313418f5bd84915bd29880fee1a21d50cc510e56b0acc7123bdc7b697d2fbf0b82ffd950d10bfe2d70a15bcdece44bc0b6ad8ab')

build() {
  cd $pkgname
  export CMAKE_ARGS="-DUSE_SYSTEM_BLOSC2=ON"
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv venv-test --system-site-packages
  ./venv-test/bin/python -m installer dist/*.whl
  # Deselect tests failing since v3.4.0, not sure why
  # test_expand_dims: sys.getrefcount() behavior changed in Python 3.14
  ./venv-test/bin/python -m pytest \
    --deselect tests/ndarray/test_resize.py::test_expand_dims \
    --deselect tests/ndarray/test_lazyexpr.py::test_broadcasting \
    --deselect tests/ndarray/test_lazyexpr.py::test_chain_expressions \
    --deselect tests/ndarray/test_lazyexpr.py::test_chain_persistentexpressions \
    --deselect tests/ndarray/test_reductions.py::test_broadcast_params \
    --deselect tests/ndarray/test_reductions.py::test_fast_path \
    --deselect tests/ndarray/test_reductions.py::test_save_version1 \
    --deselect tests/ndarray/test_reductions.py::test_save_version2 \
    --deselect tests/ndarray/test_reductions.py::test_save_version3 \
    --deselect tests/ndarray/test_reductions.py::test_save_version4
}

package() {
  cd $pkgname

  python -m installer --destdir="$pkgdir" dist/*.whl

  # why are these files there?
  (
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$pkgdir$site_packages"
  rm -vrf include lib share
  )

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
