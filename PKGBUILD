# Maintainer: artist for Artix Linux

_wfconfig_version=0.7
pkgname=wayfire
pkgver=0.10.0
pkgrel=1.1
pkgdesc="3D wayland compositor"
arch=('x86_64')
_url="https://github.com/WayfireWM"
url="$_url/$pkgname"
license=(MIT)
depends=(
         # Wayfire
         'cairo' 'pango' 'libdrm' 'libevdev'
         'libglvnd' 'libjpeg' 'libpng'
         'libxkbcommon' 'pixman' 'polkit'
         'seatd' 'xorg-xwayland' 'wayland'
         'yyjson' 'libinput'
         'glib2' 'libelogind' 'libxcb'

         # Linking Wayfire headers now requires this
         'glm'

         # wlroots
         'pkgconf' 'xcb-util-errors' 'xcb-util-renderutil'
         'xcb-util-wm' 'wayland' 'wayland-protocols'
         'libdisplay-info'
         'wlroots0.19'
)
makedepends=('meson' 'ninja' 'cmake' 'vulkan-headers' 'doctest'
             'pkgconf' 'wayland-protocols' 'libxml2' 'git'
)
optdepends=('xorg-xeyes')
provides=('wayland-compositor'
          "wf-config=${_wfconfig_version}")
conflicts=('wf-config')

source=("git+$_url/$pkgname#commit=9229cef3b65b12d5eb10697deb66b304358d99e4"
	"git+$_url/wf-config"
        "git+$_url/wf-touch"
        "git+$_url/wf-utils")
sha256sums=('ceddf00fad33242b8f8236410fa4e0709197bf156b2023df8ec2a3b1a88d2aee'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.subprojects/wlroots.update none
    git config submodule.subprojects/wf-config.url "$srcdir/wf-config"
    git config submodule.subprojects/wf-touch.url "$srcdir/wf-touch"
    git config submodule.subprojects/wf-utils.url "$srcdir/wf-utils"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname"
    artix-meson \
        --buildtype=release \
        -Dxwayland=auto \
        -Duse_system_wlroots=enabled \
        -Duse_system_wfconfig=disabled \
        -Db_lto=true \
        -Db_pie=true \
        -Dprint_trace=false \
        build
    sed "/WF_SRC_DIR/d" -i build/config.h
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir/" ninja -C build install
    rm -f $pkgdir/usr/include/$pkgname/nonstd/safe-list.hpp
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/wayland-sessions/$pkgname.desktop
    cp wayfire.ini $pkgdir/usr/share
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

