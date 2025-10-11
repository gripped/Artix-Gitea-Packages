# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_srcname=SPIRV-LLVM-Translator
pkgname=${_srcname,,}
pkgver=21.1.1
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(LicenseRef-custom)
depends=(gcc-libs glibc llvm-libs)
makedepends=(git cmake llvm spirv-headers spirv-tools)
checkdepends=(python clang)
source=(git+${url}.git#tag=v$pkgver
        '010-spirv-llvm-translator-fix-UniformId-test.patch'::'https://github.com/KhronosGroup/SPIRV-LLVM-Translator/commit/fc5873ee760c333738c9e8e8d8c2eb906f0c40f5.patch')
sha256sums=('2fb81ad0fb976874fa7437834d5e2aba49b58208e0724b950e8e3415e43e92d8'
            '7ae8f00bbe49fd6e12bfb7f8d78152d6fcff2f665ef2e3a400d12272cd924fd1')

prepare() {
  patch -d "$_srcname" -Np1 -i "${srcdir}/010-spirv-llvm-translator-fix-UniformId-test.patch"
}

pkgver() {
  git -C ${_srcname} describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
  cmake -B build -S ${_srcname} \
    -G 'Unix Makefiles' \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_INCLUDE_TESTS=ON \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
    -Wno-dev
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${_srcname}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
