# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=light-locker
pkgver=1.9.0
pkgrel=6
pkgdesc='A simple session locker for LightDM'
arch=(x86_64)
url=https://github.com/the-cavalry/light-locker
license=(GPL-2.0-only)
depends=(
  cairo
  dbus-glib
  dconf
  glibc
  libdbus-1.so
  libgdk-3.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libgtk-3.so
  libpango-1.0.so
  libpangocairo-1.0.so
  libelogind.so
  libx11
  libxext
  libxss
)
makedepends=(
  git
  glib2-devel
  gnome-common
  intltool
  meson
  upower
  xorgproto
)
optdepends=('upower: Power management support')
source=("git+https://github.com/the-cavalry/light-locker.git#tag=v${pkgver}"
        "0001-remove-systemd.patch")
b2sums=('3dbb10c1121160a004a27b679d8cd7437a6a594ef8543599f840df94317f13604896b04f15d3c018610dd5c1e7dbdb92fe8a2831909dbcae3c77e9d688fc6021'
        '72f001d8f8244debbd750e71fae2d0690e817e62ae8209717a63e51e18e1dce8872fc585f9aeb6a829dc030237cffd0e5d6ac8238c879ce8f3c7962aa820f3a8')

pkgver() {
  cd light-locker

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd light-locker

  git cherry-pick -n d3ea262b336cf66ec41d25a8ea021d759c2c3a1d
  git cherry-pick -n 366fdbfe284efacf39d887a0512d38030af7ff16
  git cherry-pick -n 6224184e2677d76c7904d488b0e9295886fa9ee3
  git cherry-pick -n 8e03981e83fd03920e8e68145d0eb933dddb4c3c
  patch -Np1 -i ../0001-remove-systemd.patch
}

build () {
  artix-meson -Dsystemd=false light-locker build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
