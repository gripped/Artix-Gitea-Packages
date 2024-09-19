# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=47.0
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
b2sums=('c146b310dcfb5e3e34a9ffa7d7f78f0b7d67e78b38bbe7f88296ebe7e3741cee01dc032e1cf9afb2c446369063eb3f4a9d88968ee53ae65f818b673be827e13b'
        '15039ed5d227d9b5dd47d28aa6674ffc2262358278e9d523178eb78081d898974b12a8e26b6de2560f52452df7e045adcf55aaea3cfe0911c1c38933ac8991db')

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
