# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64
pkgver=5243
pkgrel=1
pkgdesc='Nintendo 64 core'
arch=(x86_64)
url=https://github.com/libretro/parallel-n64
license=(GPL2)
groups=(libretro)
depends=(
  libgl
  libretro-core-info
)
makedepends=(
  git
  mesa
)
_commit=a03fdcba6b2e9993f050b50112f597ce2f44fa2c
source=(libretro-parallel-n64::git+https://github.com/libretro/parallel-n64.git#commit=${_commit}
        stdexcept.patch::https://github.com/libretro/mupen64plus-libretro-nx/commit/26fd1edd640ff3db49dd5ebb7e54f0de6600fc45.diff
        cstdint.patch::https://github.com/libretro/mupen64plus-libretro-nx/commit/2c7af614ed3da27565cc5616c908134fdd908820.diff)
sha256sums=('SKIP'
            '4df9c237e63f0052a1dc538df3c6fd1ad362a93dccca4e1ba2ff81773ff45961'
            '358031eb721d5fd337ada75a4dfa9511cf7ac7ceca2ca9cf63c0d15d2df88e4d')
options=(!lto)

pkgver() {
  cd libretro-parallel-n64
  git rev-list --count HEAD
}

prepare() {
  cd libretro-parallel-n64
  patch --strip=1 --input=../stdexcept.patch
  patch --strip=1 --input=../cstdint.patch
}

build() {
  make -C libretro-parallel-n64 \
    WITH_DYNAREC=x86_64 \
    HAVE_PARALLEL=1 \
    HAVE_PARALLEL_RSP=1 \
    HAVE_THR_AL=1
}

package() {
  install -Dm 644 libretro-parallel-n64/parallel_n64_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
