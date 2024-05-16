# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=46.0
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
  gtk-doc
  mesa
  meson
  python
  python-packaging
  xmlto
  xtrans
)
groups=(gnome)
_commit=2437153bfd7cbebe62c73926bb85f88076313963  # tags/46.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git#commit=$_commit"
        "0001-meson-add-logind-provider-option.patch")
b2sums=('509cd974134e0ff8f90cd039794eae3751d204e7f6056dd97d18ac141521026c016ee5407b8086b7a1036340e3bbf04acd629be67c125e7cd0df6dfe3ee5fb28'
        '15039ed5d227d9b5dd47d28aa6674ffc2262358278e9d523178eb78081d898974b12a8e26b6de2560f52452df7e045adcf55aaea3cfe0911c1c38933ac8991db')

pkgver() {
  cd $pkgname
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

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
