# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dinit-rc
pkgver=0.3.1
pkgrel=1
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD')
depends=('udev' 'artix-cgroups')
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
sha256sums=('ee9416d6698b6241378262ef61327868b723da9b12f403d6d74a2a8eb6296a93')

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
