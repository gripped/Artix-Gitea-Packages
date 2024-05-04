# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

pkgname=openrc-settingsd
pkgver=1.4.0
pkgrel=2
pkgdesc="System settings D-Bus service for OpenRC"
arch=('x86_64')
url="https://gitlab.com/postmarketOS/openrc-settingsd"
license=('GPL-1.0-only')
groups=('openrc-world')
depends=('gcc-libs' 'glibc' 'glib2' 'libdaemon' 'dbus' 'polkit'
        'nss-myhostname' 'openrc')
makedepends=('meson' 'python-packaging')
backup=('etc/conf.d/openrc-settingsd')
source=("https://gitlab.com/postmarketOS/openrc-settingsd/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9d09e02de0faf15ee9a6a742586cf9b1a314591ec50f84e2513636ecfe4f2ff3')

build() {
    local meson_options=(
        -Dopenrc=enabled
        -Denv-update=''
        -Dhostname-style=default
        -Dlocale-style=default
    )
    artix-meson "${pkgname}-v${pkgver}" build "${meson_options[@]}"

    meson compile -C build
}

check(){
    meson test -C build --print-errorlogs
}


package() {
    meson install -C build --destdir "${pkgdir}"

    install -Dm644 "${pkgname}-v${pkgver}"/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
