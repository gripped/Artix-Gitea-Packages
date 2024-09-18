# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Stefano Facchini <stefano.facchini@gmail.com>

pkgname=gnome-boxes
pkgver=47beta
pkgrel=1
pkgdesc='Simple GNOME application to access virtual systems'
arch=(x86_64)
url='https://apps.gnome.org/Boxes/'
license=(LGPL-2.0-or-later)
depends=(
  cairo
  cdrtools
  dconf
  edk2-ovmf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libarchive
  libgudev
  libhandy
  libosinfo
  libportal
  libportal-gtk3
  libsoup3
  libusb
  libvirt-glib
  libxml2
  qemu-desktop
  spice-gtk
  webkit2gtk-4.1
  xdg-user-dirs
)
makedepends=(
  appstream
  git
  gobject-introspection
  itstool
  meson
  vala
)
groups=(gnome-extra)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-boxes.git?signed#tag=${pkgver/[a-z]/.&}"
  git+https://gitlab.gnome.org/felipeborges/libovf-glib.git
)
b2sums=(
  a31612bc036481a8187f245d3475a1125c33d1e3be43be77dd7530cca6c2fae5d500bbaed8c093704a3ab6246e77c2ad0c465918765ba85322f71c09eb524995
  SKIP
)
validpgpkeys=(9B60FE7947F0A3C58136817F2C2A218742E016BE) # Felipe Borges <felipeborges@gnome.org>

prepare() {
  cd $pkgname

  git submodule init
  git submodule set-url subprojects/libovf-glib "$srcdir/libovf-glib"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  artix-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
