# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-control-center
pkgver=1.28.0
pkgrel=1.1
pkgdesc="The Control Center for MATE"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=('mate-menus' 'mate-settings-daemon' 'marco' 'libxss' 'mate-desktop'
         'gettext' 'accountsservice' 'mate-panel' 'libcanberra' 'udisks2' 'libayatana-appindicator')
makedepends=('itstool' 'libelogind')
groups=('mate')
conflicts=('mate-control-center-gtk3')
replaces=('mate-control-center-gtk3')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        "systemd1.patch"
        "systemd2.patch")
sha256sums=('ebf2c704fd5248dc2f9836ff29028869ef29d5054907cc615734b6383a7914bc'
            '05911f20e4c3b633a9acf7d26a36f7ef099801199137e1267bd93d0d3a1abdd7'
            '663f6b84fda56a0c7af356a12d7759626568458c9a1adbe1651726662d959f18')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's/"systemd/"libelogind/' configure
}

build() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/systemd1.patch"
    patch -Np1 -i "${srcdir}/systemd2.patch"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --disable-update-mimedb

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/share/applications/mimeinfo.cache"
}

# vim:set sw=4 et:
