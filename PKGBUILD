# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dinit-rc
pkgver=0.4.2
pkgrel=1
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD')
depends=('udev' 'artix-cgroups' 'dbus') # dbus dep is for dbus-wait-for
makedepends=('scdoc')
optdepends=('cryptsetup-dinit: Encrypted disks support'
            'lvm2-dinit: LVM support'
            'mdadm-dinit: MD devices support')
provides=('init-udev' 'init-rc')
conflicts=('init-udev' 'init-rc')
install=dinit-rc.install
backup=('etc/dinit.d/config/console.conf'
        'etc/hwclock.conf'
        'etc/rc.local'
        'etc/rc.shutdown')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('c1fec237b7a46547608fbcd9097f048a1a555633042a6fa61b39ec2294c9172e')

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
