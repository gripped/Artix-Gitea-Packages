# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=48.0
pkgrel=1
pkgdesc="The GNOME Session Handler"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  bash
  dconf
  gcc-libs
  glib2
  glibc
  gnome-desktop
  gnome-keyring
  gnome-mimeapps
  gsettings-desktop-schemas
  gtk3
  json-glib
  libepoxy
  libgl
  libice
  libsm
  libx11
  libxcomposite
  libxtst
  libelogind
  xdg-desktop-portal-gnome
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gtk-doc
  mesa
  meson
  python
  xmlto
  xtrans
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git#tag=${pkgver/[a-z]/.&}"
        "0001-meson-add-logind-provider-option.patch")
b2sums=('e7364791aae9fe2be01dc907218b5208eb7cb7aa27e18f34b41502459aab1333327ba0c82511d0021ee20758eb3dace4145be2a6776ee2cc90c8b04d4bcb738d'
        '016b4861e92f75c2a880f5479d6c05970949955b4682474f327356520d1198fc96f20fccfd34a65261a97de70f47e62996df9d4884f9a5704ff73f2b9f14e8d7')

prepare() {
  cd $pkgname
  git apply -3 ../0001-meson-add-logind-provider-option.patch
}

build() {
  artix-meson $pkgname build -Dlogind_provider=elogind
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
