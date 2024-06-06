# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

pkgname=esettingsd
_pkgname=openrc-settingsd
pkgver=1.4.0
pkgrel=2
pkgdesc="System settings D-Bus service for non-OpenRC systems"
arch=('x86_64')
url="https://gitlab.com/postmarketOS/openrc-settingsd"
license=('GPL')
depends=('gcc-libs' 'glibc' 'glib2' 'libdaemon' 'dbus' 'polkit'
        'nss-myhostname')
makedepends=('meson' 'python-packaging')
provides=('settingsd')
conflicts=('openrc-settingsd')
source=("https://gitlab.com/postmarketOS/openrc-settingsd/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "artix.patch"
        "ntp.patch")
sha256sums=('9d09e02de0faf15ee9a6a742586cf9b1a314591ec50f84e2513636ecfe4f2ff3'
            '177aef1c2dfe37b645ae46f34cbd969d6a3215abbdfb155726dfc01bdf81f7eb'
            '392c13c918f58be216a0420af0a7a3f367831b0e5f7fc39e3608f6d8e7b317b5')

prepare() {
    cd "${_pkgname}-v${pkgver}"
    patch -p1 < ../artix.patch
    patch -p1 < ../ntp.patch
}

build() {
    local meson_options=(
        -Dopenrc=disabled
        -Denv-update=''
        -Dhostname-style=default
        -Dlocale-style=default
    )
    artix-meson "${_pkgname}-v${pkgver}" build "${meson_options[@]}"

    meson compile -C build
}

check(){
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "${pkgdir}"

    install -Dm644 "${_pkgname}-v${pkgver}"/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
