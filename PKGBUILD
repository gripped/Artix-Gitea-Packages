# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=47.0.1
pkgrel=2
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
b2sums=('66034808c7c395c6c8fd9285dd6cc8602c0f1a65b4b0fd980b3bd4192420b25dc076d69e71a1be79247670504132734bc71e8b05ef5419294e4913d42bb1ff9e'
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
