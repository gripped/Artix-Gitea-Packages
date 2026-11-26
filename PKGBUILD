# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=hipblas-common
pkgver=10.2
pkgrel=1
pkgdesc='Common files shared by hipBLAS and hipBLASLt'
arch=('any')
url='https://rocm.docs.amd.com/projects/hipBLAS/en/latest/index.html'
license=('MIT')
depends=('rocm-core')
makedepends=(
  'cmake'
  'hip-runtime-amd'
  'rocm-cmake'
)
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('3eb4c2347a0882ecebd4360f3a2c10c15555651aab656cf9159336c180ea14a0')

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
