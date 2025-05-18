# Maintainer: artist for Artix Linux

pkgname=wcm
pkgver=0.9.0
pkgrel=2
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
    -Dwf_shell=enabled \
    -Denable_wdisplays=true
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}

sha256sums=('cd77a6b46b831ccda6859ae90fdd4fe6c0087abe9ea7fb045a8c421df251444b')

