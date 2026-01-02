# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-applets
_pkgname=libmateweather
pkgver=1.28.1
pkgrel=3
pkgdesc="Applets for MATE panel"
arch=('x86_64')
url="https://mate-desktop.org"
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=('cpupower' 'gtksourceview4' 'libgtop' 'libnotify' 'mate-panel' 'polkit' 'upower' 'wireless_tools' 'libnl')
makedepends=('autoconf-archive' 'intltool' 'itstool' 'mate-common' 'glib2-devel' 'gucharmap' 'yelp-tools' 'libsoup' 'git')
optdepends=('fortune-mod: for displaying fortune cookies in the Wanda the Fish applet'
            'gucharmap: character picker applet')
groups=('mate-extra')
conflicts=('mate-applets-gtk3' 'mate-netspeed' 'mate-netspeed-gtk3')
replaces=('mate-applets-gtk3' 'mate-netspeed' 'mate-netspeed-gtk3')
source=("git+https://github.com/mate-desktop/libmateweather.git#branch=1.28")
sha256sums=('SKIP')

prepare() {
	cd "${_pkgname}"
	./autogen.sh
}

build() {
    	cd "${_pkgname}"
    	./configure \
        	--prefix=/usr \
        	--sysconfdir=/etc \
		--libexecdir="/usr/lib/${pkgname}" \
        	--with-dbus-sys="/usr/share/dbus-1/system.d" \
        	--enable-polkit \
        	--enable-ipv6
    	make
}

package() {
    	cd "${_pkgname}"
    	make DESTDIR="${pkgdir}" install
}
