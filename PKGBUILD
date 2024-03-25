# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nautilus
pkgname=(
  nautilus
  libnautilus-extension
  libnautilus-extension-docs
)
pkgver=46.0
pkgrel=1
pkgdesc="Default file manager for GNOME"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
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
  pango
  tracker3
)
makedepends=(
  appstream-glib
  gi-docgen
  git
  gobject-introspection
  meson
  tracker3-miners
)
checkdepends=(python-gobject)
_commit=dcd221d57d0180d9d5cc0524bc6e3278d3d3a04c  # tags/46.0^0
source=(
  "git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
)
b2sums=('eb963b0b45afc66f6d331db2405bc0cb951c799f5341283dc10a5b598ba55bded847c6f88919f8391185ab57e6931d0899cf32b363066ed6f21864b0a39d7636')

pkgver() {
  cd nautilus
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd nautilus
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
  optdepends=(
    'nautilus-sendto: Send files via mail extension'
    'tracker3-miners: Full text search and metadata-based renaming'
  )
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
