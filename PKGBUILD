# Maintainer: artist for Artix Linux

pkgname=wcm
pkgver=0.10.0
pkgrel=1
pkgdesc='Wayfire Config Manager'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
depends=(gtkmm3 wayfire wf-shell)
makedepends=(wayland-protocols meson ninja extra-cmake-modules git)
optdepends=("wayfire-plugins-extra: configuration for extra Wayfire plugins")
source=("${pkgname}::git+https://github.com/WayfireWM/wcm#tag=v${pkgver}")

build () {
  CFLAGS+=" -Wno-incompatible-pointer-types"
  export PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig
  artix-meson "${pkgname}" build \
    --auto-features=disabled \
    -Dwf_shell=enabled
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}

sha256sums=('aa3bcacd4d4314b5a61738de66bee541f50d086f20882ad4f0597ea8846dec88')

