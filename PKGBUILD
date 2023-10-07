# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-session
pkgver=45.0
pkgrel=1
pkgdesc="The GNOME Session Handler"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL)
depends=(
  dconf
  elogind
  gnome-desktop
  gsettings-desktop-schemas
  json-glib
  libgl
  libsm
  libxtst
)
makedepends=(
  docbook-xsl
  git
  gtk-doc
  mesa
  meson
  python
  xmlto
  xtrans
)
groups=(gnome)
options=(debug)
_commit=998ed1d8ee2ff5396583c284230648625b4103e5  # tags/45.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git#commit=$_commit"
        "0001-meson-add-elogind-support.patch")
b2sums=('SKIP'
        'edcab77762e92e95c1b6a2305d4835ae7a2ef6a38f25b4ff100432395de56c2d6de78ffbc04aec6b9d955a945357fbdae2a574723c429022b0404e649f5a3d56')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\.beta/beta/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # enable buidling with elogind
  git apply -3 ../0001-meson-add-elogind-support.patch
}
 
build() {
  artix-meson $pkgname build \
    -Delogind=true \
    -Dsystemd=false \
    -Dsystemd_journal=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
