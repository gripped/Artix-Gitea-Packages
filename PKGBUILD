# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/libpamac

ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=libpamac
pkgver=11.6.4
pkgrel=2
pkgdesc="Pamac package manager library based on libalpm"
arch=('x86_64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL-3.0-only')
depends=(
    'glibc'
    'glib2'
    'json-glib'
    'libsoup3'
    'polkit'
    'pacman' 'libalpm.so'
    'bash'
    'appstream'
    #'archlinux-appstream-data'
)
makedepends=(
    'gettext'
    'itstool'
    'vala'
    'asciidoc'
    'meson'
    'gobject-introspection'
    'git'
    'dbus-glib'
    'vte3'
    'appstream-glib'
    'gnutls'
    'libnotify'
)
backup=('etc/pamac.conf')
conflicts=('libpamac' 'libpamac-all')
provides=('libpamac')
options=(!lto)
install=pamac.install
source=(
  "git+$url.git#tag=$pkgver"
  fix-appstream-data.sh
  fix-appstream-data.hook
)
sha256sums=('13a3304b018330470ce20c6408134cd8a22bde5bddfc907a8f7f913d492d1ffe'
            '6e0c25f0fcb0076ce78845b037e32925fcc3f1cd1670062c48ed35f564a10244'
            'b5236af02c25cd7de4b2c9c2d0f064dac3c2f54da5cc72bf72fc6236a34bd9c4')

_meson_options=()
if (( ENABLE_FLATPAK )); then
  depends+=('flatpak')
  _meson_options+=('-Denable-flatpak=true')
fi

if (( ENABLE_SNAPD )); then
  depends+=('snapd' 'snapd-glib')
  _meson_options+=('-Denable-snap=true')
fi

# create_links() {
#   # create soname links
#   find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
#       _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
#       _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
#       [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
#       [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
#   done
# }

build() {
    _meson_options+=(
        -Denable-aur=true
        -Denable-appstream=true
    )
    artix-meson "$pkgname" build "${_meson_options[@]}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    # fix appstream issue
    install -Dm644 "$srcdir/fix-appstream-data.hook" "$pkgdir/etc/pacman.d/hooks/fix-appstream-data.hook"
    install -Dm755 "$srcdir/fix-appstream-data.sh" "$pkgdir/etc/pacman.d/hooks.bin/fix-appstream-data.sh"
}
