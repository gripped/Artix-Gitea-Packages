# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=49.0
pkgrel=1
pkgdesc="The GNOME Session Handler"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  gcc-libs
  glib2
  glibc
  gnome-desktop-4
  gsettings-desktop-schemas
  gtk4
  json-glib
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
conflicts=(gnome-mimeapps)
replaces=(gnome-mimeapps)
provides=(gnome-mimeapps)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git#tag=${pkgver/[a-z]/.&}"
        "0001-meson-add-logind-provider-option.patch")
b2sums=('b8f4494818e8943dae6a13f2af42de47e672068530e67c1a718753cf2fb29e5eb7fe57b5b13093e1cd68ee8b75501d2a81dced4319f4fed05969091d83165edf'
        '016b4861e92f75c2a880f5479d6c05970949955b4682474f327356520d1198fc96f20fccfd34a65261a97de70f47e62996df9d4884f9a5704ff73f2b9f14e8d7')

prepare() {
  cd $pkgname
  git apply -3 ../0001-meson-add-logind-provider-option.patch
}

build() {
  local meson_options=(
    -D docbook=true
    -D man=true
  )

  artix-meson $pkgname build -Dlogind_provider=elogind "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
