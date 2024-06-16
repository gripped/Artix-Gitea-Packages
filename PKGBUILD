# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blosc2
pkgver=2.6.2
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
  python-py-cpuinfo
)
makedepends=(
  cmake
  cython
  ninja
  python-build
  python-installer
  python-scikit-build
  python-setuptools
)
checkdepends=(
  python-psutil
  python-pytest
  #python-pytorch
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('51fb90575443ebac7d32dede0ae1d639cc29a8fb4989a59af997c3c72789c3ed')
b2sums=('9e90dc2c834599165ddace77cb455507a0ba19d12a4ad2269597cb7978fbd4efd227f86e8342db4bbdf962c5bb1466f74e0461cf56db2856d21dd79777754fa8')

build() {
  cd "$pkgname-$pkgver"
  export CMAKE_ARGS="-DUSE_SYSTEM_BLOSC2=ON"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$pkgname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
