# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

pkgname=openrc-settingsd
pkgver=1.5.0
pkgrel=1
pkgdesc="System settings D-Bus service for OpenRC"
arch=('x86_64')
url="https://gitlab.com/postmarketOS/openrc-settingsd"
license=('GPL-1.0-only')
groups=('openrc-world')
depends=('gcc-libs' 'glibc' 'glib2' 'libdaemon' 'dbus' 'polkit'
        'nss-myhostname' 'openrc')
makedepends=('meson' 'python-packaging' 'glib2-devel')
backup=('etc/conf.d/openrc-settingsd')
source=("https://gitlab.com/postmarketOS/openrc-settingsd/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f4a74262e0012783047ec1d12dfdf4ef3a983e9abaeb436e17703d6881f72292')

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
