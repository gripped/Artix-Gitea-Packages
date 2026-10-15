# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naether.markus@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=rocblas
pkgver=10.0
pkgrel=2
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocBLAS/en/latest/index.html'
license=('MIT')
depends=(
  'cblas'
  'glibc'
  'hip-runtime-amd'
  'libgcc'
  'openmp'
  'rocm-core'
  'roctracer'
)
makedepends=(
  'amdsmi'
  'cmake'
  'ninja'
  'gcc-fortran'
  # find_package(Git REQUIRED) for the commit ID in the version string
  'git'
  'msgpack-cxx'
  'perl-file-which'
  'python'
  'python-joblib'
  'python-msgpack'
  'python-pyaml'
  'python-tensile'
  'python-wheel'
  'rocm-cmake'
  'rocm-toolchain'
  'rocm-llvm'
  'gtest'
)
optdepends=(
  'python-yaml: for rocblas-bench and rocblas-gemm-tune'
  'gtest: for rocblas-bench and rocblas-gemm-tune'
  'amdsmi: for rocblas-bench and rocblas-gemm-tune'
)
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('628dc9a5c43ecb70414da7abb591a0996d215d2bd62d0bc587fe808508731035')

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"

  # Reduce massive spam in log files
  CXXFLAGS+=" -Wno-unused"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -G Ninja
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
    -D CMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
    # Enable rocblas-bench and rocblas-gemm-tune
    -D BUILD_CLIENTS_BENCHMARKS=ON
    # The clients default to ILP64 OpenBLAS, which CMake's FindBLAS does not
    # find in Arch. Use LP64 netlib CBLAS and BLAS through pkg-config instead.
    -D ROCBLAS_CLIENTS_REFERENCE_ILP64=OFF
    -D BLA_PREFER_PKGCONFIG=ON
    -D BLA_PKGCONFIG_BLAS=cblas
    -D HIP_PLATFORM=amd
    -D BUILD_WITH_TENSILE=ON
    -D Tensile_LIBRARY_FORMAT=msgpack
    -D Tensile_COMPILER=hipcc
    # Use the installed python-tensile instead of a virtualenv
    -D BUILD_WITH_PIP=OFF
    # hipblaslt doesn't support all relevant targets
    -D BUILD_WITH_HIPBLASLT=OFF
    -D GPU_TARGETS=$(rocm-supported-gfx)
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
