# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-utils
pkgver=1.28.1
pkgrel=1
pkgdesc="Common MATE utilities for viewing disk usage, logs and fonts, taking screenshots, managing dictionaries and searching files"
url="http://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('mate-desktop' 'gettext' 'libcanberra' 'libgtop' 'libsm' 'udisks2' 'libxml2')
makedepends=('autoconf-archive' 'git' 'glib2-devel' 'inkscape' 'intltool' 'itstool' 'mate-common' 'mate-panel' 'python' 'yelp-tools')
optdepends=('mate-panel: Look up words in dictionaries from the panel')
groups=('mate-extra')
conflicts=('mate-utils-gtk3')
replaces=('mate-utils-gtk3')
source=("git+https://github.com/mate-desktop/mate-utils.git#tag=v${pkgver}"
        git+https://github.com/mate-desktop/mate-submodules.git)
sha256sums=('13f3f19761ca97bba876b863c1f5fba2cd6553d9cbfa032bdaa155240c850f56'
            'SKIP')
prepare() {
	cd "${pkgname}"
	git submodule init
	git config submodule.mate-submodules.url "${srcdir}/mate-submodules"
	git -c protocol.file.allow=always submodule update
	./autogen.sh
}

build() {
    	cd "${pkgname}"
    	./configure \
        	--prefix=/usr \
        	--libexecdir=/usr/lib/${pkgname} \
        	--sysconfdir=/etc \
        	--disable-maintainer-flags
    	make
}

package() {
    	cd "${pkgname}"
    	make DESTDIR="${pkgdir}" install
}
