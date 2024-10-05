# Maintainer: artist for Artix Linux

pkgname=wayfire
pkgver=0.9.0
pkgrel=3
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

source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        'decor_title_font_scale.patch'
        'add-session-lock-config.patch')

build() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../decor_title_font_scale.patch
  patch -Np1 -i ../add-session-lock-config.patch
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
sha256sums=('dd0c9c08b8a72a2d8c3317c8be6c42b17a493c25abab1d02ac09c24eaa95229d'
            '93f5d78348618acf95dfba9490d1e529fb3a281b5ab61edb923dc5fdcbc14e70'
            '5608b9c7d4e2dcd662b3553e1c50b5ce88a7848e29018c9446f47c28257f862c')

