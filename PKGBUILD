# Maintainer: Artist <artist@artixlinux.org>
# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=libpamac
pkgver=11.7.4
pkgrel=4
pkgdesc="Pamac package manager library based on libalpm"
arch=('x86_64')
url="https://github.com/manjaro/libpamac"
license=('GPL-3.0-only')
depends=(
    'appstream'
    'bash'
    'glib2'
    'glibc'
    'json-glib'
    'libsoup3'
    'pacman>=7.0.0' 'libalpm.so'
    'polkit'
)
makedepends=(
    'appstream-glib'
    'asciidoc'
    'dbus-glib'
    'gettext'
    'git'
    'gnutls'
    'gobject-introspection'
    'itstool'
    'libnotify'
    'meson'
    'vala'
    'vte3'
)
provides=(
    'libpamac-appstream.so'
    'libpamac-aur.so'
    'libpamac.so'
)
options=(!lto)
backup=('etc/pamac.conf')
install=pamac.install
source=(
    "git+$url.git#tag=$pkgver"
    fix-appstream-data.sh
    fix-appstream-data.hook
)
sha256sums=('13f531db76921740e7d5b2478cc774d29757313ff4a85befe5c683c6b0cd0d47'
            '6e0c25f0fcb0076ce78845b037e32925fcc3f1cd1670062c48ed35f564a10244'
            'b5236af02c25cd7de4b2c9c2d0f064dac3c2f54da5cc72bf72fc6236a34bd9c4')

prepare() {
    #cd "$pkgname"
    sed -e 's/alpm_option_set_disable_sandbox/alpm_option_set_disable_sandbox_syscalls/' \
        -i "$pkgname"/vapi/libalpm.vapi
}

build() {
    local _meson_options=()
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
