# Maintainer: artist for Artix Linux

pkgname=wayfire
pkgver=0.10.0
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/WayfireWM/wayfire"
license=(MIT)
depends=(
  'cairo' 'pango' 'libdrm' 'libevdev' 'libglvnd' 'libjpeg' 'libpng' 'libxkbcommon'
  'pixman' 'polkit' 'seatd' 'xorg-xwayland' 'wayland' 'wf-config'
  'glm' 'glslang' 'libinput' 'libdisplay-info' 'libxcb' 'opengl-driver'
  'xcb-util-errors' 'xcb-util-renderutil' 'xcb-util-wm' 'libpixman-1.so' 'libseat.so'
  'libudev.so' 'libvulkan.so' 'libwayland-client.so' 'libwayland-server.so' 'libxkbcommon.so'
)
makedepends=('meson' 'ninja' 'cmake' 'vulkan-headers' 'doctest'
             'pkgconf' 'wayland-protocols' 'nlohmann-json' 'libxml2'
)
optdepends=('xorg-xeyes')

source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "${pkgname}-${pkgver}"
  artix-meson \
    --buildtype=release \
    -Dxwayland=auto \
    -Duse_system_wlroots=disabled \
    -Duse_system_wfconfig=enabled \
    -Db_lto=true \
    -Db_pie=true \
    build
  sed "/WF_SRC_DIR/d" -i build/config.h
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop
  cp wayfire.ini $pkgdir/usr/share
  install -Dm644 "LICENSE" \
  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('83f98d67479f41f3a4dcf30b414495bb8df2353daa7601159f4012a120827a16')

