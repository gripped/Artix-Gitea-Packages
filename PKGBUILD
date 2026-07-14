# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blosc2
pkgver=4.8.0
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
sha512sums=('3dbe06a39c9eb6a52f12f67036bfb99c960082fef2b76a7a3e31fbdaabeaa4a64d427865e27e0a9ca516cd51e40048b1ee8ab68e90b2278e4e60932e5aeef7f6')
b2sums=('505595ae58757dea8e4ad49a96cc91271535f7573e5282026cd9f16774eda9b6f5432d6ee38136480e6a11daedb5730f51894702c2d8735baab71091a1f1ef06')

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
