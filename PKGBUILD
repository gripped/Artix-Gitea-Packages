# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=51.0
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
b2sums=('341be544f20ccb5b7e919fea5d62b2455772d64b9e20f7f26dbe98932e65fad59f350b70a28170fd8d1ee3bb9731dabefb2512d82f4eab4ca7a44f8030eb5fc2'
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
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
