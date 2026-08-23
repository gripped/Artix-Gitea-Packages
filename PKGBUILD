# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=nanobind
pkgdesc="Tiny and efficient C++/Python bindings"
pkgver=3.0.0
pkgrel=1
arch=(any)
url="https://github.com/wjakob/nanobind"
license=(BSD-3-Clause)
depends=(
  python
  robin-map
)
makedepends=(
  cmake
  eigen
  git
  python-build
  python-installer
  python-scikit-build-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-scipy
  python-tests
)
source=(
  "git+$url.git#tag=v$pkgver"
)
b2sums=('96e2bbde18bdf2444f082fe9817124587afc8f964d7e95028f14527d5de80cb92ab5afc36b2cb31aa87236ac30034238869e2e7922b26c0be820e430d3291a5d')

build() {
  cd $pkgname
  SKBUILD_CMAKE_ARGS="-DCMAKE_BUILD_TYPE=None;-DNB_USE_SUBMODULE_DEPS=OFF" \
  python -m build --wheel --no-isolation
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DNB_TEST_STABLE_ABI=ON \
    -DNB_TEST_SHARED_BUILD=ON \
    -DNB_USE_SUBMODULE_DEPS=OFF \
    -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname
  # one test requires running pytest from the build directory
  cd build
  python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  local python_version=$(python -c "import sys; print(sys.version[:4])")
  install -vdm755 "$pkgdir/usr/include"
  ln -vs "../lib/python$python_version/site-packages/nanobind/include/nanobind" \
    "$pkgdir/usr/include/nanobind"
  install -dm755 "$pkgdir/usr/lib/cmake"
  ln -vs "../../lib/python$python_version/site-packages/nanobind/cmake" \
    "$pkgdir/usr/lib/cmake/nanobind"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
