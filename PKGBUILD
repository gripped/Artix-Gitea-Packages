# Maintainer: Chris Cromer <cromer@artixlinux.org>
pkgbase=libpamac
pkgname=('libpamac' 'libpamac-flatpak-plugin')
pkgver=11.4.1
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm"
arch=('x86_64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('glib2' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'appstream-glib' 'libalpm.so>=13' 'libalpm.so<14' 'git')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection' 'flatpak' 'asciidoc')
replaces=('pamac-common')
options=(!emptydirs !strip)
source=(https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/libpamac-$pkgver.tar.bz2)
sha256sums=('f0aa76f16b3dadfd6a2c72008953e9f89488cd1da8b3d8349114bbf86ce20b5d')

build() {
  cd $pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr \
              --sysconfdir=/etc \
              -Denable-flatpak=true \
              --buildtype=release
  meson compile
}

package_libpamac() {
  optdepends=('libpamac-flatpak-plugin' 'archlinux-appstream-data')
  backup=('etc/pamac.conf')
  install=libpamac.install
  cd "$srcdir/libpamac-$pkgver"
  cd builddir
  DESTDIR="$pkgdir" meson install
  # remove pamac-flatpak
  rm "$pkgdir/usr/share/vala/vapi/pamac-flatpak.vapi"
  rm "$pkgdir/usr/include/pamac-flatpak.h"
  rm "$pkgdir/usr/lib/libpamac-flatpak.so"
  rm "$pkgdir/usr/lib/libpamac-flatpak.so.11"
}

package_libpamac-flatpak-plugin() {
  pkgdesc="Flatpak plugin for Pamac"
  depends=('flatpak' 'libpamac')
  provides=('pamac-flatpak-plugin')
  conflicts=('pamac-flatpak-plugin')
  replaces=('pamac-flatpak-plugin')
  install=libpamac-flatpak-plugin.install
  cd "$srcdir/libpamac-$pkgver"
  install -Dm644 "builddir/src/pamac-flatpak.vapi" "$pkgdir/usr/share/vala/vapi/pamac-flatpak.vapi"
  install -Dm644 "builddir/src/pamac-flatpak.h" "$pkgdir/usr/include/pamac-flatpak.h"
  install -Dm755 "builddir/src/libpamac-flatpak.so.11" "$pkgdir/usr/lib/libpamac-flatpak.so.11"
  ln -sr "$pkgdir/usr/lib/libpamac-flatpak.so.11" "$pkgdir/usr/lib/libpamac-flatpak.so"
}
