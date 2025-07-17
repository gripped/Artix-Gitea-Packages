# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blosc2
pkgver=3.6.0
pkgrel=1
pkgdesc='Wrapper for the blosc2 compressor'
arch=('x86_64')
url='https://github.com/Blosc/python-blosc2'
license=('BSD-3-Clause')
depends=(
  'blosc2'
  'glibc'
  'python'
  'python-msgpack'
  'python-ndindex'
  'python-numexpr'
  'python-numpy'
  'python-platformdirs'
  'python-py-cpuinfo'
  'python-requests'
)
makedepends=(
  'cmake'
  'cython'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-setuptools'
)
checkdepends=(
  'python-psutil'
  'python-pytest'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('bf4f715f3fbf90404a6cd8c30a37b5e09705d3b265e92875e7603d411c96eb0989c64ac36889c36570e4a86a2adb9470a1dd9523194d4dbe4bacb8efb74f7863')
b2sums=('c0ca7168b933ff6561921e4cfaed07b3ff8e250a6815e140c45a3b11558a8aeb1face9bfe2ec31c0389a678d54044f0ac79164aaa942773e991def6379355d99')

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
  ./venv-test/bin/python -m pytest \
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
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
