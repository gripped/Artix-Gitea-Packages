# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-mupen64plus-next
pkgver=454
pkgrel=1
epoch=1
pkgdesc='Nintendo 64 core'
arch=(x86_64)
url=https://github.com/libretro/mupen64plus-libretro-nx
license=(GPL2)
groups=(libretro)
depends=(
  gcc-libs
  glibc
  libgl
  libpng
  libretro-core-info
  minizip
  xxhash
  zlib
)
makedepends=(
  git
  mesa
  nasm
)
replaces=(libretro-mupen64plus)
_commit=4d270850bd09f8630110da701b73107e45a6e202
source=(libretro-mupen64plus-next::git+https://github.com/libretro/mupen64plus-libretro-nx.git#commit=${_commit}
        stdexcept.patch::https://github.com/libretro/mupen64plus-libretro-nx/commit/26fd1edd640ff3db49dd5ebb7e54f0de6600fc45.diff
        cstdint.patch::https://github.com/libretro/mupen64plus-libretro-nx/commit/2c7af614ed3da27565cc5616c908134fdd908820.diff)
sha256sums=('SKIP'
            '4df9c237e63f0052a1dc538df3c6fd1ad362a93dccca4e1ba2ff81773ff45961'
            '358031eb721d5fd337ada75a4dfa9511cf7ac7ceca2ca9cf63c0d15d2df88e4d')
options=(!lto)

pkgver() {
  cd libretro-mupen64plus-next

  git rev-list --count HEAD
}

prepare() {
  cd libretro-mupen64plus-next

  patch --strip=1 --input=../stdexcept.patch
  patch --strip=1 --input=../cstdint.patch
}

build() {
  make \
    WITH_DYNAREC=x86_64 \
    HAVE_PARALLEL_RDP=1 \
    HAVE_PARALLEL_RSP=1 \
    HAVE_THR_AL=1 \
    SYSTEM_LIBPNG=1 \
    SYSTEM_MINIZIP=1 \
    SYSTEM_XXHASH=1 \
    SYSTEM_ZLIB=1 \
    -C libretro-mupen64plus-next
}

package() {
  install -Dm 644 libretro-mupen64plus-next/mupen64plus_next_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
