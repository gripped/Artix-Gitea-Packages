# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=10.0
pkgrel=2
_pkgdesc="Heterogeneous Interface for Portability"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
_amd_depends=('rocm-core' 'bash' 'perl' 'glibc' 'libgcc' 'numactl'
         'mesa' 'comgr' 'rocminfo' 'rocm-llvm' 'libelf' 'rocprofiler-register')
_nvidia_depends=('cuda')
makedepends=('git' 'cmake' 'python' 'python-cppheaderparser' 'rocm-llvm-static'
             "${_amd_depends[@]}" "${_nvidia_depends[@]}")
_tag="tag=therock-$pkgver"
_release="https://github.com/ROCm/rocm-systems/releases/download/therock-$pkgver"
# HIPCC compiler wrapper
_hipcc='https://github.com/ROCm/llvm-project'
source=("$pkgbase-clr-$pkgver.tar.gz::$_release/clr.tar.gz"
        "$pkgbase-hip-$pkgver.tar.gz::$_release/hip.tar.gz"
        "$pkgbase-hipother-$pkgver.tar.gz::$_release/hipother.tar.gz"
        "$pkgbase-hipcc::git+$_hipcc#$_tag"
        # https://github.com/ROCm/rocm-systems/pull/12596
        "$pkgbase-no-host-noinline.patch::https://github.com/ROCm/rocm-systems/commit/5d7969b1005b2c688057097a46a0a63860d7367c.patch")
sha256sums=('07caed9d726232008a2120da24f4e4bbc4998accbeadd309181fce04a9da9f99'
            '373958090db3cab854fa8a0baa5e4f9afe0ea423def204b241bfcbe74f6ce0ca'
            '6a9c7fe1d61b2682be9287c512d95c4e37773c8ffd6ab3752bc87a515567d1c8'
            '55ade468dfcb50bc6dbfd6c3a53c801744893cbd6d685d6d1da421d399e2cf58'
            'eebeb2ae0ec4c33627b2a445eb97832d737f4ec77d4cd74c55d4b9348bded591')

options=(!lto)

prepare() {
  # clr installed include dir in bulk, so we need to exclude the *.orig file
  patch -Np2 --no-backup-if-mismatch -i "$srcdir/$pkgbase-no-host-noinline.patch"
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
  optdepends=('inetutils: Print hostname in hipconfig'
              'cuda: Cross compile for nvidia')
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
