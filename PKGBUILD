# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100@lavabit.com>
# Contributor: Valère Monseur <valere.monseur@ymail.com>

pkgname=picom
pkgver=12
pkgrel=1
pkgdesc="A lightweight compositor for X11"
url="https://picom.app"
arch=('x86_64')
license=('MPL-2.0 AND MIT')
depends=('hicolor-icon-theme' 'libconfig' 'libdbus' 'libev' 'libgl' 'pcre2' 'pixman'
         'xcb-util-image' 'xcb-util-renderutil' 'libepoxy')
makedepends=('asciidoctor' 'git' 'mesa' 'meson' 'ninja' 'setconf' 'uthash')
optdepends=('dbus: for controlling picom via D-Bus'
            'python: for running picom-convgen.py'
            'rtkit: for realtime scheduling priority'
            'xorg-xprop: for picom-trans'
            'xorg-xwininfo: for picom-trans')
backup=('etc/xdg/picom.conf')
source=("git+https://github.com/yshui/picom.git?signed#tag=v${pkgver}")
validpgpkeys=('A22F5C0F4FCF9C7C89A167462C965E9E5D45D730') # Yuxuan Shui <yshuiv7@gmail.com>
b2sums=('6a4cdf010b5314516ff14b1b9cf1d00fe2e9876642e4c0bf4cfb8912925f6837973cda56b5b08e226245e3f112ebd597f73ef0d777fe69032b20be29df8fced3')

prepare() {
	cd "${pkgname}"
	# More subtle transparency in the default settings
	setconf picom.sample.conf 'frame-opacity=0.9;'
	setconf picom.sample.conf 'inactive-opacity=0.95;'
	# Improve performance (recommended option)
	setconf -u picom.sample.conf 'glx-no-stencil=true;'
}

build() {
	cd "${pkgname}"
	mkdir -p build
	artix-meson --buildtype=release -D with_docs=true build
	ninja -v -C build
}

check() {
	cd "${pkgname}"
	ninja -C build test
}

package() {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install

	# Default and example configuration
	install -Dm 644 "${pkgname}.sample.conf" "${pkgdir}/etc/xdg/picom.conf"
	install -Dm 644 "${pkgname}.sample.conf" "${pkgdir}/usr/share/doc/picom/picom.conf.example"

	# License
	install -Dm 644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
