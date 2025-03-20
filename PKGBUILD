# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=xdg-desktop-portal-gnome
pkgver=48.0
pkgrel=1
pkgdesc="Backend implementation for xdg-desktop-portal for the GNOME desktop environment"
url="https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dconf
  fontconfig
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  graphene
  gtk4
  libadwaita
  libx11
  nautilus
  wayland
  xdg-desktop-portal
  'xdg-desktop-portal-gtk>=1.10.0-2'
)
makedepends=(
  git
  glib2-devel
  meson
)
optdepends=('evince: Print previews')
provides=(xdg-desktop-portal-impl)
conflicts=('xdg-desktop-portal-gtk<1.10.0-2')
replaces=('xdg-desktop-portal-gtk<1.10.0-2')
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git?signed#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/libgxdp.git#commit=541cb84a3e91d1d7759d78a800e40567bf23fedc"
)
b2sums=('3c8252c34968b2dc2ee4b92186f6606927a1fd614814e5f642f767086b25966148a8f3437c365ca81b0748d7651b4fe5cf32a927a8658aecda50924f049fb388'
        '2c0e9b71f2d9fc9031b35c46841d2770322a75429fe6b701e3cc9646f0295e9aacc9f3e3d2c8aac07356c6f4ca0c62da13ff74b9213e507ac8925a37df96371f')
validpgpkeys=(
  8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A # Jonas Ådahl <jadahl@gmail.com>
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
)

prepare() {
  cd $pkgname
}

build() {
  # Inject libgxdp
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  artix-meson $pkgname build -Dsystemduserunitdir=/usr/lib/systemd
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r $pkgdir/usr/lib/systemd
}

# vim:set sw=2 sts=-1 et:
