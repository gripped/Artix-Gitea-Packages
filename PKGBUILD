# Maintainer: artist for Artix Linux
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=libmateweather
pkgver=1.28.1
pkgrel=1
pkgdesc="Provides access to weather information from the Internet."
url="https://mate-desktop.org"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libsoup3' 'gettext')
makedepends=('glib2-devel' 'gtk-doc' 'git')
conflicts=('libmateweather-gtk3')
replaces=('libmateweather-gtk3')
source=("git+https://github.com/mate-desktop/libmateweather.git#commit=dcd6be514a3d7e5d0a3f935a21a9af70cd62a86a")
sha256sums=('8556f68e0da35d9acc9a27d26239c470c22fc6a6a899104130d921578e147638')

prepare() {
    	cd "${pkgname}"
    	autoreconf -fiv
}

build() {
    	cd "${pkgname}"
    	./configure \
        	--prefix=/usr \
        	--sysconfdir=/etc \
        	--localstatedir=/var \
        	--enable-locations-compression

    	#https://bugzilla.gnome.org/show_bug.cgi?id=656231
    	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    	make
}

package() {
    	cd "${pkgname}"
    	make DESTDIR="${pkgdir}" install
}
