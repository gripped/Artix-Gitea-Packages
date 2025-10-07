# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-validation-layers
pkgver=1.4.328.0
pkgrel=1
pkgdesc="Vulkan Validation Layers"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  spirv-tools
)
makedepends=(
  cmake
  git
  libxrandr
  ninja
  python-lxml
  spirv-headers
  vulkan-headers
  vulkan-icd-loader
  vulkan-utility-libraries
  wayland
)
options=(
  # https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994
  !lto
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/Vulkan-ValidationLayers#tag=vulkan-sdk-$pkgver")
b2sums=('7d043dfd061078127b3bae65785415c283d0741df86544199787cc2364a19d320399f3076e105df0e19c8fb6e76ac83d0fa7220785609a81abc2dba2e62b6abb')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
  )

  cmake -S Vulkan-ValidationLayers -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -p "$pkgdir/usr/share/doc"
  cp -a Vulkan-ValidationLayers/docs "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set sw=2 sts=-1 et:
