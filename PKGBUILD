# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=lib32-spirv-llvm-translator
pkgver=23.1.1
pkgrel=1
pkgdesc="LLVM <-> SPIR-V converter for compilers targeting SPIR-V (32-bit)"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(NCSA)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-llvm-libs
  lib32-spirv-tools
  spirv-llvm-translator
)
makedepends=(
  cmake
  git
  lib32-llvm
  ninja
  spirv-headers
)
checkdepends=(
  clang
  python
)
source=(
  git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator#tag=v$pkgver
)
b2sums=('467f062a15e8148dea0c853535bc5d8cd9f70b45ef2184bdee7b590d323ba8644c9e014b0c8fece450c49ff5f17f9c00fefcec5f5f9c54d2a4cb7a7853b46b59')

build() {
  export CMAKE_PREFIX_PATH=/usr
  export CMAKE_INSTALL_LIBDIR=/usr/lib32
  local cmake_options=(
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_SKIP_RPATH=ON
    -D LLVM_CONFIG=llvm-config32
    -D LLVM_EXTERNAL_LIT=/usr/bin/lit
    -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv
    -D LLVM_LIBDIR_SUFFIX=32
    -D LLVM_SPIRV_ENABLE_LIBSPIRV_DIS=ON
    -D LLVM_SPIRV_INCLUDE_TESTS=ON
    -W no-author
  )

  export ASFLAGS+=" --32"
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cmake -S SPIRV-LLVM-Translator -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  # Does not use ctest-compatible targets
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include}

  install -Dm644 SPIRV-LLVM-Translator/LICENSE.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
