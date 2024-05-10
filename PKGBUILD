# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Blue Peppers <bluepeppers@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Yannick LM <LMyannicklm1337@gmail.com>

pkgname=tint2
pkgver=17.0.2
pkgrel=4.1
pkgdesc='Basic, good-looking task manager for WMs'
arch=(x86_64)
url='https://gitlab.com/o9000/tint2'
license=(GPL-2.0-only)
depends=(gtk3 imlib2 startup-notification)
makedepends=(cmake git ninja setconf)
source=("git+${url}.git#tag=${pkgver}"
        fix_segfault.patch
        fix_overflow.patch)
sha256sums=('60dcde15ac09508daffe59b9c35244fee771f66ee989193f37d81c823fc643da'
            'b7cd2936bb807478bbb356b96879dedbbfc464ed2f930f426a0123e39884f78f'
            '9dd0dbae92941fcee2cc74d71e97504815b91d8aa681053db0483066e21c1829')

prepare() {
	setconf "${pkgname}/get_version.sh" VERSION="${pkgver}"
	# Patch to fix segfault issue when opening some apps like conky, mpv or steam
	# See https://gitlab.archlinux.org/archlinux/packaging/packages/tint2/-/issues/1
	cd "${pkgname}"
	patch -Np1 < "${srcdir}/fix_segfault.patch"
	patch -Np1 < "${srcdir}/fix_overflow.patch"
}

build() {
	mkdir -p build
	cd build
	cmake ../"${pkgname}" \
	  -D CMAKE_INSTALL_PREFIX=/usr \
	  -D ENABLE_TINT2CONF=1 \
	  -G Ninja
	ninja
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
