# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgbase=onnx
pkgname=(onnx python-onnx)
pkgver=1.19.0
pkgrel=1
epoch=1
pkgdesc='Open standard for machine learning interoperability'
arch=('x86_64')
url='https://onnx.ai'
license=('MIT')
makedepends=(
  cmake
  git
  protobuf
  pybind11
  python
  python-build
  python-installer
  python-numpy
  python-protobuf
  python-setuptools
  python-wheel
)
source=("${pkgname}::git+https://github.com/onnx/onnx.git#tag=v${pkgver}")
sha512sums=('35991abcc8bd0c054497f4e304e06141872e2f0c51dca9e6014195f5745f84abc64b0d2c9e6f872c83dcfda3074f05c5bb4aa5d51ca1f637b33b3afdb60d60dd')


prepare() {
  cd $pkgbase
  # Remove cmake and protobuf dependencies since we don't want to pull the
  # corresponding packages from PyPI
  sed -i 's/requires = .*/requires = ["setuptools"]/' pyproject.toml
}

build() {
  local _cmake_args=(
    -DCMAKE_BUILD_TYPE='None'
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=TRUE
    -DCMAKE_VERBOSE_MAKEFILE=ON
    -DONNX_USE_PROTOBUF_SHARED_LIBS=ON
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )
  cd $pkgbase
  CMAKE_ARGS="${_cmake_args[@]}" python -m build --wheel --no-isolation
}

package_onnx() {
depends=(
  gcc-libs
  glibc
  abseil-cpp
  protobuf
)
  DESTDIR="$pkgdir" cmake --install $pkgbase/.setuptools-cmake-build
  install -Dm644 $pkgbase/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-onnx() {
depends=(
  onnx
  python
  glibc
  gcc-libs
  protobuf
  python-protobuf
  python-numpy
)
  cd $pkgbase
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
