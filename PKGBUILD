# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=50.0
pkgrel=1
pkgdesc="The GNOME Session Handler"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  glib2
  glibc
  gnome-desktop-4
  gsettings-desktop-schemas
  libgcc
  libelogind
  xdg-desktop-portal-gnome
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  libxslt
  meson
  xmlto
)
optdepends=('gnome-keyring: Secrets service backend')
conflicts=(gnome-mimeapps)
replaces=(gnome-mimeapps)
provides=(gnome-mimeapps)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git#tag=${pkgver/[a-z]/.&}"
        0001-meson-allow-building-with-elogind.patch)
b2sums=('255580de8e1a260d7d677049abac79e782e675d979de390209fab824b0fdb6d683916abd85f5e9c3fda33f19a97c9a6fbc5ad3cc171697c9286d418a56f98190'
        '0685ff053573841b23fe427e79bc9e42aaef92017f479b59347645083830efbe9a08a27d62afb74d0cdc1b5e341be5139b3d8eeb194d3b322f272aaf0d40da4f')

prepare() {
  cd $pkgname
  patch -Np1 -i ../0001-meson-allow-building-with-elogind.patch
}

build() {
  local meson_options=(
    -D docbook=true
    -D man=true
  )

  artix-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
