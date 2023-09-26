# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo
pkgver=6.338.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader' 'libvulkan.so' 'glslang' 'lcms2' 'liblcms2.so' 'shaderc' 'libshaderc_shared.so'
         'glibc' 'gcc-libs' 'libunwind' 'libdovi.so')
makedepends=(
  'meson' 'ninja' 'vulkan-headers' 'glad' 'nuklear'
  'python' 'python-setuptools' 'python-mako' 'python-markupsafe' 'python-jinja'
)
provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('84d4ef1becd365944e7c0857b98ef08c3e98f6d381a0be3efee3a8982f97f9a2e91b6ee0d40a70fe2abefc6ff5f045d8680838a0e34e3b3565202b899c973fe1')
b2sums=('dd92ce79ee0c9d04c44ef810490cc2d14553a906f58f97cc9e22b086f3369eef2f89e529c71f2e4a224307ead94396071c27a6d37d26d3a6dbf38f10df02b25a')

build() {
  cd ${pkgbase}-v${pkgver}
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
  ninja -C build
}

check() {
  cd ${pkgbase}-v${pkgver}
  ninja -C build test
}

package() {
  cd ${pkgbase}-v${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
