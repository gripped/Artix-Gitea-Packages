# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=libplacebo
pkgver=7.387.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('vulkan-icd-loader' 'glslang' 'lcms2' 'shaderc'
         'glibc' 'libgcc' 'libstdc++' 'libunwind' 'libdovi' 'xxhash')
makedepends=(
  'meson' 'ninja' 'vulkan-headers' 'glad' 'nuklear'
  'python' 'python-setuptools' 'python-mako' 'python-markupsafe' 'python-jinja'
  'libglvnd'
)
provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('57db9dd1526345dd95033fb4ae0db0ae8ae311973a3159307b67fd5504dad7810ed406f76c8ab7e952f7556e598cccaeb4abe6d2f5f623a73ed63418442337ae')
b2sums=('e0b25ca4af9c4e318ea33b1db3bf20b2e2a8aae153e7e896856e65d14a1c1b3a2dba96d216c01de568d1f23499257cdc3ca13fdb6ecb7c8e2cc705be232c3d9d')

build() {
  cd ${pkgname}-v${pkgver}
  CXXFLAGS+=" -I/usr/include/glslang"
  artix-meson build \
    -D tests=true \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D libdovi=enabled \
    -D demos=false
  meson compile -C build
}

check() {
  cd ${pkgname}-v${pkgver}
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    'libdovi.so'
    'liblcms2.so'
    'libshaderc_shared.so'
    'libvulkan.so'
  )

  cd ${pkgname}-v${pkgver}
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
