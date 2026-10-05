# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-smi-lib
pkgver=10.0
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocm_smi_lib/en/latest'
license=('NCSA')
depends=(
    'glibc'
    'hsa-rocr'
    'libgcc'
    'python'
    'rocm-core'
)
makedepends=('cmake')
_git='https://github.com/ROCm/rocm-systems'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('031cdcf1649bc0bf22d0c326e709ba78ad67b8e4c8c5f27023624b03a056c525')
options=(!lto)

build() {
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
