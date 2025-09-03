# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_name=pycuda
pkgname=python-pycuda
pkgver=2025.1.1
pkgrel=2
pkgdesc="Python wrapper for Nvidia CUDA"
arch=(x86_64)
url="https://documen.tician.de/pycuda/"
license=(
  Apache-2.0
  MIT
)
depends=(
  boost-libs
  cuda
  gcc-libs
  glibc
  nvidia-utils
  python
  python-numpy
  python-pytools
)
makedepends=(
  boost
  ctags
  mesa
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
provides=(pycuda-headers)
conflicts=(pycuda-headers)
replaces=(pycuda-headers)
source=($_name-$pkgver.tar.gz::https://github.com/inducer/pycuda/archive/refs/tags/v$pkgver.tar.gz
        fix-cuda-13.patch)
sha512sums=('fb1710ea9a77ea70c9e6955e6db0a7cfea1f52db28fa0f48b17717d4fe3222d61d324879297cb34059a7c943bfb1faa02ebb935f4c8ffb800c7c8110088107db'
            '2313c2a3c37dbac021fc9b16bc16b2469a6cc9c9c9401b9f826db1427dd8fe8c7081abef1bd4c6d3e309606adb322915a9c6c57b15dd76c481dce1195225477b')
b2sums=('99c74e5d06b2917385beb64a594b95b5996aee90c585eb0c5f8640aac42a4a7e2e61840b4bd3820c980b05007b84f93f3c391928d449ea0d848365d28c754eb1'
        '39a0e802b40e4e59f9099aa7abd6551f0d4308c4d3aad0d219f55a9ee8bfc2f1649be75ea0b1df80c4b6ea5ed4b155c5fe3159feb4bd98faa79fea2a5fd85a39')

prepare() {
  local lib_arch=''
  [[ "$CARCH" = "x86_64" ]] && lib_arch='64'

  # create local siteconf.py for build system
  # defaults can be compared from running the ./configure.py script
  {
    printf "BOOST_PYTHON_LIBNAME = ['boost_python3']\n"
    printf "CUDA_ROOT = '/opt/cuda'\n"
    printf "USE_SHIPPED_BOOST = False\n"
  } > $_name-$pkgver/siteconf.py

  # we ship python-numpy
  sed -e 's/oldest-supported-numpy/numpy/' -i $_name-$pkgver/pyproject.toml

  # CUDA 13 fix https://github.com/inducer/pycuda/pull/486
  patch -p1 -d $_name-$pkgver < fix-cuda-13.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# requires an Nvidia graphics card to run
# check() {
#   local pytest_options=(
#     -vv
#     --ignore examples/from-wiki/simple_speed_test.py
#   )
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

#   cd $_name-$pkgver
#   # install to temporary location, as importlib is used
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
#   pytest "${pytest_options[@]}"
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
