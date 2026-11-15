# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=blocaled
pkgver=0.7
pkgrel=1
pkgdesc='Provides a stand-alone implementation of the localed D-Bus service.'
arch=('x86_64')
url='https://github.com/lfs-book/blocaled'
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'glib2'
    'libdaemon'
    'polkit'
)
makedepends=(
    'dbus'
    'glib2-devel'
    'gtk-doc'
)
conflicts=('openrc-settingsd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('80271fc44ea6449890c4d0aa4cfd9d8a66191b1a1c5122c0a19990c56f304926')

prepare() {
    cd ${pkgname}-${pkgver}
    sed -e 's|$(sysconfdir)/dbus-1/system.d|/usr/share/dbus-1/system.d|' -i Makefile.am
}

build(){
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/blocaled \
        --with-keyboardconfig=/etc/vconsole.conf \
        --with-localeconfig=/etc/locale.conf
    make
}

# check(){
#     cd ${pkgname}-${pkgver}
#     make -k check
# }

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
