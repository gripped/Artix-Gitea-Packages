# Maintainer: Florian Pritz <bluewind@xinu.at>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Todd Musall <tmusall@comcast.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=apcupsd
pkgver=3.14.14
pkgrel=8
pkgdesc="Power mangement and controlling most of APC's UPS models"
arch=(x86_64)
url="http://www.apcupsd.org"
license=('GPL')
depends=('gcc-libs' 'svc-manager' 'libusb-compat')
optdepends=('gd: for CGI')
makedepends=('gd')
backup=(etc/apcupsd/apcupsd.conf
        etc/apcupsd/hosts.conf
        etc/apcupsd/multimon.conf
        etc/apcupsd/apcupsd.css
        etc/apcupsd/changeme
        etc/apcupsd/commfailure
        etc/apcupsd/commok
        etc/apcupsd/offbattery
        etc/apcupsd/onbattery
        etc/apcupsd/apccontrol)
source=(https://downloads.sourceforge.net/apcupsd/$pkgname-$pkgver.tar.gz{,.sig}
		apcupsd_shutdown
        apcupsd-tmpfiles.conf)
sha256sums=('db7748559b6b4c3784f9856561ef6ac6199ef7bd019b3edcd7e0a647bf8f9867'
            'SKIP'
            'a5e3a4c3a47d1abdf23b0a7c3832ad5a00e1cab03fe51336a4ee5f236152a60d'
            'a4474cfcd607c5e9b64e27eec7cbc2b0bcf08c8ea37fd1f0f28e98ac2883fd4f')
validpgpkeys=(635B9D943945DCA05BE9AB0A24E84804A57B2D90)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr  --libexecdir=/usr/lib/$pkgname \
		--sbindir=/usr/bin \
		--enable-cgi --enable-usb --enable-net \
		--with-upstype=usb --with-upscable=usb \
		--with-serial-dev=/dev/usb/hid/hiddev[0-9] \
		--disable-gapcmon --enable-modbus-usb
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	sed -i 's#^LOCKFILE .*$#LOCKFILE /run/apcupsd#' "$pkgdir/etc/apcupsd/apcupsd.conf"

	install -Dm644 "$srcdir/apcupsd-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/apcupsd.conf"
	install -Dm755 "$srcdir/apcupsd_shutdown" "$pkgdir/usr/lib/elogind/system-shutdown/apcupsd_shutdown"

	chmod 755 "$pkgdir"/usr/bin/*
	mv "$pkgdir/usr/bin/"smtp{,-$pkgname}

	install -dm755 "$pkgdir/usr/lib/$pkgname/cgi-bin"
	mv "$pkgdir"/etc/apcupsd/*.cgi "$pkgdir/usr/lib/$pkgname/cgi-bin"

	rm -rf "$pkgdir/usr/share/hal"
}
