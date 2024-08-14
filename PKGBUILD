# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=125
pkgrel=1.1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://github.com/polkit-org/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  lib32-glib2
  lib32-glibc
  lib32-elogind
  polkit
)
makedepends=(
  dbus
  git
  glib2-devel
  lib32-pam
  meson
  libelogind
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
source=(
  "git+$url#tag=$pkgver"
  "0001-remove-systemd.patch"
)
b2sums=('3a3d10173937bd7d869e1125878bec0b6f6ac565ffea7bbf61a05634cfbe85471dc62386825a201915c03c48cbcda277704011ec760a283e5b9663ad49cf0237'
        '14fa7864a677c45a5b1b69e4c431b7e31a865092eb5225d66ef71b954f185bb6cff4397a1207cda99de7b726b398395d3cb2ce0765904e61742665efa6a4bc1b')

prepare() {
  cd polkit
  patch -Np1 -i ../0001-remove-systemd.patch
}

build() {
  local meson_options=(
    --cross-file lib32
    -D introspection=false
    -D libs-only=true
    -D os_type=redhat
    -D session_tracking=elogind
    -D polkitd_uid=102
    -D polkitd_user=polkitd
    -D session_tracking=logind
    -D tests=true
  )

  artix-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

#check() {
 # meson test -C build --print-errorlogs -t 3
#}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{include,lib,share}
}

# vim:set sw=2 sts=-1 et:
