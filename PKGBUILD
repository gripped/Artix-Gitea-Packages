# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dinit-rc
pkgver=0.1.3
pkgrel=1
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD')
depends=('udev')
provides=('init-udev' 'init-rc')
conflicts=('init-udev' 'init-rc')
backup=('etc/dinit.d/config/cgroups.conf'
        'etc/dinit.d/config/hwclock.conf'
        'etc/dinit.d/config/rc.local'
        'etc/dinit.d/config/rc.shutdown')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('bd3f30ef1061b9f780bbe0368950f077ca86e5f12b884abf028427609ff375f7')

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
