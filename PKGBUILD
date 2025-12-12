# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac

ENABLE_FAKE_GNOME_SOFTWARE=0
_cli_ver=11.7.4

pkgname=pamac
pkgver=11.7.4
pkgrel=4
pkgdesc="A Gtk3 frontend, Package Manager based on libalpm with AUR and Appstream support"
arch=('x86_64')
url="https://github.com/manjaro/pamac"
license=('GPL-3.0-only')
depends=(
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'gtk4'
    'libadwaita'
    'libnotify'
    'libpamac'
)
makedepends=(
    'asciidoc'
    'desktop-file-utils'
    'gettext'
    'git'
    'gnutls'
    'gobject-introspection'
    'itstool'
    'libhandy'
    'meson'
    'vala'
    'xorgproto'
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
    "git+https://github.com/manjaro/pamac.git#tag=v$pkgver"
    "git+https://github.com/manjaro/pamac-cli.git#tag=$_cli_ver"
)
sha256sums=('465f0bfa3aa0ac536c9838ffc934f2ee9bbf0ee403ed202fa86ce2ecfd601707'
            'a347066c47a3e6ad8d32f6b947f4568592bd1bf038ea9b72a387b6f81a95c0ee')

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
