# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=6.2.0
pkgrel=1
_pkgdesc="Heterogeneous Interface for Portability"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
_amd_depends=('rocm-core' 'bash' 'perl' 'glibc' 'gcc-libs' 'numactl'
         'mesa' 'comgr' 'rocminfo' 'rocm-llvm' 'libelf' 'rocprofiler-register')
_nvidia_depends=('cuda')
makedepends=('cmake' 'python' 'python-cppheaderparser' 'hipcc'
             "${_amd_depends[@]}" "${_nvidia_depends[@]}")
# Common HIP dir (AMD or nVidia)
_hip='https://github.com/ROCm/HIP'
# ROCclr, HIPAMD and OpenCl repositories
_clr='https://github.com/ROCm/clr'
# Cross compilation
_hipother='https://github.com/ROcm/hipother'
source=("$pkgbase-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgbase-clr-$pkgver.tar.gz::$_clr/archive/rocm-$pkgver.tar.gz"
        "$pkgbase-hipother-$pkgver.tar.gz::$_hipother/archive/rocm-$pkgver.tar.gz")
sha256sums=('7ca261eba79793427674bf2372c92ac5483cc0fac5278f8ad611de396fad8bee'
            '620e4c6a7f05651cc7a170bc4700fef8cae002420307a667c638b981d00b25e8'
            '1f854b0c07d71b10450080e3bbffe47adaf10a9745a9212797d991756a100174')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirclr="$(basename "$_clr")-$(basename "${source[1]}" ".tar.gz")"
_dirhipother="$(basename "$_hipother")-$(basename "${source[2]}" ".tar.gz")"

build() {
  local hip_amd_args=(
    -Wno-dev
    -S "$srcdir/$_dirclr"
    -B build-amd
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DHIP_PLATFORM=amd
    -DHIP_COMMON_DIR="$srcdir/$_dirhip"
    -DHIPCC_BIN_DIR=/opt/rocm/bin
    -DHIPNV_DIR="$srcdir/$_dirhipother/hipnv"
    -DHIP_CATCH_TEST=0
    -DCLR_BUILD_HIP=ON
    -DCLR_BUILD_OCL=OFF
  )
  cmake "${hip_amd_args[@]}"
  cmake --build build-amd

  local hip_nvidia_args=(
    -Wno-dev
    -S "$srcdir/$_dirclr"
    -B build-nvidia
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DHIP_PLATFORM=nvidia
    -DHIP_COMMON_DIR="$srcdir/$_dirhip"
    -DHIPCC_BIN_DIR=/opt/rocm/bin
    -DHIPNV_DIR="$srcdir/$_dirhipother/hipnv"
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
  DESTDIR="$pkgdir" cmake --install build-amd
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hip-runtime-nvidia() {
  pkgdesc="$_pkgdesc (Nvidia runtime)"
  depends=("${_nvidia_depends[@]}")
  DESTDIR="$pkgdir" cmake --install build-nvidia
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
