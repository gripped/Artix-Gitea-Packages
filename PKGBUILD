# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-blosc2
pkgver=3.3.2
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
sha512sums=('5bd4c79b19664ed8e6c418faf522bb32a72292766e0581f56e9c757f8bd01546a33ec1c860f2f29d2bb414a21c28a08ca2420d3e88c18a0b50ba8223076ffd75')
b2sums=('4d462daaacc104a8980b61abcfb967e76b3ec145aef4ffb39665e040457b657594707db0cde95f349e54d78c9f8a8cb9b5e840650341c2f6c11d28784cbe8d47')

build() {
  cd $pkgname
  export CMAKE_ARGS="-DUSE_SYSTEM_BLOSC2=ON"
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv venv-test --system-site-packages
  ./venv-test/bin/python -m installer dist/*.whl
  ./venv-test/bin/python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
