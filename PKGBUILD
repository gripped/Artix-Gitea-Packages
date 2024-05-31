# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dinit-rc
pkgver=0.3.6
pkgrel=1
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD')
depends=('udev' 'artix-cgroups' 'dbus') # dbus dep is for dbus-wait-for
optdepends=('cryptsetup-dinit: Encrypted disks support'
            'lvm2-dinit: LVM support'
            'mdadm-dinit: MD devices support')
provides=('init-udev' 'init-rc')
conflicts=('init-udev' 'init-rc')
backup=('etc/dinit.d/config/console.conf'
        'etc/dinit.d/config/hwclock.conf'
        'etc/dinit.d/config/rc.local'
        'etc/dinit.d/config/rc.shutdown')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('4d55053211752ea91e70ffeaaf616e4e3c261783040e29b6a87ca2a12fc59115')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install

	# iputils
	mkdir -p "$pkgdir/usr/lib/sysctl.d"

	# copying
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/dinit-rc/COPYING"
}
