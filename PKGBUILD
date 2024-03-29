# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac

ENABLE_FAKE_GNOME_SOFTWARE=0
_cli_ver=11.6.0

pkgname=pamac
pkgver=11.7.1
pkgrel=1
pkgdesc="A Gtk3 frontend, Package Manager based on libalpm with AUR and Appstream support"
arch=('x86_64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL-3.0-only')
depends=(
    'glibc'
    'glib2'
    'gdk-pixbuf2'
    'gtk3'
    'libnotify'
    'libadwaita'
    'gtk4'
    'libpamac'
)
makedepends=(
    'gettext'
    'itstool'
    'vala'
    'meson'
    'gnutls'
    'gobject-introspection'
    'libhandy'
    'desktop-file-utils'
    'xorgproto'
    'asciidoc'
    'git'
)
optdepends=(
    'polkit-gnome: needed for authentification in Cinnamon, Gnome'
    'lxsession: needed for authentification in Xfce, LXDE etc.'
)
conflicts=('pamac-tray-appindicator' 'pamac-cli')
provides=('pamac-cli' 'libpamac-gtk.so')
options=(!lto)
install=pamac.install
source=(
    "git+https://gitlab.manjaro.org/applications/pamac.git#tag=$pkgver"
    "git+https://gitlab.manjaro.org/applications/pamac-cli.git#tag=$_cli_ver"
)
sha256sums=('4e9d1beebe05135c5a7972aeff12c39594b16edd02cec6aff7191a4ad301c031'
            '5e045f7661066cdcbfca3c397097a6ea6e12c257c26a9edb28ae1109165392e2')

_meson_options=()
if (( ENABLE_FAKE_GNOME_SOFTWARE )); then
  conflicts+=('pamac-gnome-integration' 'pamac-gnome-integration-dev' 'gnome-software')
  _meson_options+=(-Denable-fake-gnome-software=true)
fi

build() {
    artix-meson "$pkgname" build "${_meson_options[@]}"
    meson compile -C build

    artix-meson "$pkgname-cli" build-cli "${_meson_options[@]}"
    meson compile -C build-cli
}

package() {
    meson install -C build --destdir "$pkgdir"
    meson install -C build-cli --destdir "$pkgdir"

    install -Dm644 "$pkgname/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
