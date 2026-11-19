# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=10.2
pkgrel=1
_pkgdesc="Heterogeneous Interface for Portability"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
_amd_depends=('rocm-core' 'bash' 'perl' 'glibc' 'libgcc' 'numactl'
         'comgr' 'rocminfo' 'rocm-llvm' 'libelf' 'rocprofiler-register')
_nvidia_depends=('cuda')
makedepends=('git' 'cmake' 'python' 'python-cppheaderparser' 'rocm-llvm-static' 'mesa'
             "${_amd_depends[@]}" "${_nvidia_depends[@]}")
_tag="tag=therock-$pkgver"
_release="https://github.com/ROCm/rocm-systems/releases/download/therock-$pkgver"
# HIPCC compiler wrapper
_hipcc='https://github.com/ROCm/llvm-project'
source=("$pkgbase-clr-$pkgver.tar.gz::$_release/clr.tar.gz"
        "$pkgbase-hip-$pkgver.tar.gz::$_release/hip.tar.gz"
        "$pkgbase-hipother-$pkgver.tar.gz::$_release/hipother.tar.gz"
        # clr includes the HRR capture header from hrr/include
        "$pkgbase-hrr-$pkgver.tar.gz::$_release/hrr.tar.gz"
        "$pkgbase-hipcc::git+$_hipcc#$_tag"
        # https://github.com/ROCm/rocm-systems/pull/12596
        "$pkgbase-no-host-noinline.patch::https://github.com/ROCm/rocm-systems/commit/5d7969b1005b2c688057097a46a0a63860d7367c.patch?full_index=1"
        # https://github.com/ROCm/rocm-systems/pull/13277
        "$pkgbase-stripped-symtab.patch::https://github.com/ROCm/rocm-systems/commit/e9f923eadedbe0a9b7e969940114cd00aade7ebd.patch?full_index=1")
sha256sums=('3f73ed3c58c8aad8e734d8c233f35aace432446c6202645c3a2c90323cf56dff'
            '9c50388cdcc345e468a90220887068944e84f3ca924caa106f6ce7e462fafc2c'
            'a0f241f7ee99d7862744da108bb40b4668027335e7923a5edbd5599029e2983a'
            'adebfbf2b81edae003783a6322bbcba8ad02db5da8f1925e3c1edafee09c2cb4'
            'ac64ae579579a140db931d74e08720503fdc49d5d1925c4be6c8a4ee12661d9f'
            'SKIP'
            'SKIP')

options=(!lto)

prepare() {
  # clr installed include dir in bulk, so we need to exclude the *.orig file
  patch -Np2 --no-backup-if-mismatch -i "$srcdir/$pkgbase-no-host-noinline.patch"
  # The ROCr part goes to hsa-rocr
  git apply -p2 --include='clr/*' "$srcdir/$pkgbase-stripped-symtab.patch"
}

build() {
  local hipcc_common_args=(
    -Wno-dev
    -S "$srcdir/$pkgbase-hipcc/amd/hipcc"
    -D CMAKE_BUILD_TYPE=None
  )

  local hipcc_amd_args=(
    "${hipcc_common_args[@]}"
    -B build-amd-hipcc
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${hipcc_amd_args[@]}"
  cmake --build build-amd-hipcc

  local hip_amd_args=(
    -Wno-dev
    -S "$srcdir/clr"
    -B build-amd
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DHIP_PLATFORM=amd
    -DLLVM_ROOT=/opt/rocm/lib/llvm
    -DClang_ROOT=/opt/rocm/lib/llvm
    -DHIP_COMMON_DIR="$srcdir/hip"
    -DHIPCC_BIN_DIR="$srcdir/build-amd-hipcc"
    -DHIPNV_DIR="$srcdir/hipother/hipnv"
    -DHIP_CATCH_TEST=0
    -DCLR_BUILD_HIP=ON
    -DCLR_BUILD_OCL=OFF
  )
  cmake "${hip_amd_args[@]}"
  cmake --build build-amd

  local hipcc_nvidia_args=(
    "${hipcc_common_args[@]}"
    -B build-nvidia-hipcc
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${hipcc_nvidia_args[@]}"
  cmake --build build-nvidia-hipcc

  local hip_nvidia_args=(
    -Wno-dev
    -S "$srcdir/clr"
    -B build-nvidia
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DHIP_PLATFORM=nvidia
    -DHIP_COMMON_DIR="$srcdir/hip"
    -DHIPCC_BIN_DIR="$srcdir/build-nvidia-hipcc"
    -DHIPNV_DIR="$srcdir/hipother/hipnv"
    -DHIP_CATCH_TEST=0
    -DCLR_BUILD_HIP=ON
    -DCLR_BUILD_OCL=OFF
  )
  cmake "${hip_nvidia_args[@]}"
  cmake --build build-nvidia
}

package_hip-runtime-amd() {
  pkgdesc="$_pkgdesc (AMD runtime)"
  depends=("${_amd_depends[@]}")
  # libamdhip64 loads libGL with dlopen for OpenGL interop
  optdepends=('inetutils: Print hostname in hipconfig'
              'cuda: Cross compile for nvidia'
              'mesa: OpenGL interop')
  replaces=("hip")
  provides=("hip=${pkgver}")
  DESTDIR="$pkgdir" cmake --install build-amd
  install -Dm644 "$srcdir/hip/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hip-runtime-nvidia() {
  pkgdesc="$_pkgdesc (Nvidia runtime)"
  depends=("${_nvidia_depends[@]}")
  DESTDIR="$pkgdir" cmake --install build-nvidia
  install -Dm644 "$srcdir/hip/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
