# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.9.1
pkgrel=1
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'gspell: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue2: share current location'
            'gsound: Notification Sounds'
            'libayatana-appindicator: for App Indicator on Wayland'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP'
            'emoji-font: for emojis support')
source=("https://dev.gajim.org/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz"
        disable-failing-test.patch)
sha512sums=('c7495a2af18027358edda990d72f7a9e74c3169e252914001635ab38c633ed8549e186920f50ad64e3c6fdce0168eb5917244d53a66d4902d35a0bb1032dfdbf'
            '6244bf8738baf57e391140a7df7f270394b05055ebdf57acd5f30ffd0afec542ccd4348e59a7c64a1ecfb7b7d29ef21e2f823ea765a5281eba63692b9ab488f3')
b2sums=('a25cfb2f90fbf963dea538c280bb671674f661bcb363bc7107d7637d04ef52d1fc0eb4beb1bd06ca83971f7b94bdec954837494a7d43dc4a68670a8ead706c62'
        '4bcc5859ea58bee9fabb2888172aed80bfe240bc5888c9795e382ddc511b51b7f0f5b63e6c207370e182ed41bc08242f8f38574dddf26803c30fda465924870c')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ../disable-failing-test.patch # Disable test that fails with pango
}

build() {
	cd "${pkgname}-${pkgver}"
	./pep517build/build_metadata.py -o dist/metadata
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m unittest discover -s test
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	./pep517build/install_metadata.py dist/metadata --prefix="${pkgdir}/usr"
}
