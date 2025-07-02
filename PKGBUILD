# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=blueman
pkgver=2.4.5
pkgrel=1
pkgdesc="GTK+ Bluetooth Manager"
url="https://github.com/blueman-project/blueman"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('bluez' 'bluez-libs' 'gtk3' 'libnm' 'python-cairo' 'python-gobject')
makedepends=('cython' 'intltool' 'iproute2')
optdepends=('dnsmasq: Network Access Point (NAP) support'
            'iproute2: Network Access Point (NAP) support'
            'networkmanager: Dial Up Networking (DUN) and Personal Area Networking (PAN) support'
            'pulseaudio-bluetooth: audio devices support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fdb492afbe138eb5257530c16d0c8f6f41817a749b5f27ff24888dc386be62f0')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
	  --prefix='/usr' \
	  --sysconfdir='/etc' \
	  --libexecdir="/usr/lib/${pkgname}" \
	  --with-dhcp-config='/etc/dhcpd.conf' \
	  --disable-schemas-compile
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm -r $pkgdir/usr/lib/systemd
}
