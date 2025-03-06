# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.37.0
pkgrel=2
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=(
  glibc
  gcc-libs
  libblake3
  mimalloc
  tbb
  zlib
  zstd
)
makedepends=(
  cmake
  git
  mold
  python
)
checkdepends=(
  clang
  libdwarf
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('c73c99d6484b4ebc2c070938ecee47ff2c463d34dfcc91fe40412046f42fa8b9b7539d2f495fe927709631b8d9899f68fed19aff9b571aea1c40412158b5a626')
b2sums=('7aa9e7d6f431bfc05b60ed91b6bfe5859aa1b37d155a5f6a767be640ce0f13120a79ed83240a088e9164ffa14103f5481a12cb2e7e869bbfc56330d72bbdb2f3')

build() {
  cmake \
  -S "${pkgname}" \
  -B build \
  -D CMAKE_BUILD_TYPE='None' \
  -D CMAKE_INSTALL_PREFIX='/usr' \
  -D CMAKE_INSTALL_LIBEXECDIR='lib' \
  -D MOLD_USE_SYSTEM_MIMALLOC=ON \
  -D MOLD_USE_SYSTEM_TBB=ON \
  -D MOLD_LTO=ON \
  -D MOLD_USE_MOLD=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/mold/LICENSE
}
