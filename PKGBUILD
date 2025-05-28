# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nautilus
pkgname=(
  nautilus
  libnautilus-extension
  libnautilus-extension-docs
)
pkgver=48.2
pkgrel=1
pkgdesc="Default file manager for GNOME"
url="https://apps.gnome.org/Nautilus/"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-autoar
  gnome-desktop-4
  graphene
  gst-plugins-base-libs
  gstreamer
  gtk4
  gvfs
  hicolor-icon-theme
  libadwaita
  libcloudproviders
  libgexiv2
  libportal
  libportal-gtk4
  libx11
  localsearch
  pango
  tinysparql
  wayland
  xdg-user-dirs-gtk
)
makedepends=(
  appstream
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
)
checkdepends=(python-gobject)
source=(
  "git+https://gitlab.gnome.org/GNOME/nautilus.git#tag=${pkgver/[a-z]/.&}"
  0001-Disable-tracker-test.patch
)
b2sums=('8fa2029d0cd17bb01861ac9bac645a2d00cb4c6ec45fd5e3af70f4f77d0d265e044d73a35b14402bcdac17d1bbceeb3d863e090ea38e2a823d0e6d5d01c905ce'
        'b70c17cc83308e25fa1d5fcc0c735f82ba641fa6f78a064c5b01d65fa5b45505d23247528e2d97254a6983e939e3e9e1b1a737f3aab2546e5ecc825f954d9dcc')
validpgpkeys=(
  6B211753AC950672287226800538577822AE4B17 # António Fernandes <antoniof@gnome.org>
  550660707A6F40376B9B9F8D504A78811E6160CC # Corey Berla <corey@berla.me>
)

prepare() {
  cd nautilus

  # Tracker test is broken in our build containers
  git apply -3 ../0001-Disable-tracker-test.patch
}

build() {
  local meson_options=(
    -D docs=true
    -D packagekit=false
  )

  artix-meson nautilus build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_nautilus() {
  depends+=(libnautilus-extension.so)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick libne usr/include
  _pick libne usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne usr/share/gir-1.0

  _pick ldocs usr/share/doc
}

package_libnautilus-extension() {
  pkgdesc="Extension interface for Nautilus"
  depends=(
    gcc-libs
    glib2
    glibc
  )
  provides=(libnautilus-extension.so)

  mv libne/* "$pkgdir"
}

package_libnautilus-extension-docs() {
  pkgdesc="Extension interface for Nautilus (documentation)"
  depends=()

  mv ldocs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
