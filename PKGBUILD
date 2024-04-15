# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_commit=2530c4aadd46cd1e4a44df7f595ee33fc9c4b86e

pkgname=runit-rc
pkgver=20240415
pkgrel=1
pkgdesc='Artix Linux system initialization and shutdown for runit'
arch=('x86_64')
url='https://gitea.artixlinux.org/artix/runit-rc'
license=('BSD')
makedepends=('git')
depends=('procps-ng' 'bash' 'eudev-runit')
provides=('init-rc')
conflicts=('init-rc')
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')
optdepends=('lvm2-runit: LVM support for runit'
            'cryptsetup-runit: Enable boot support for encrypted partitions')

build() {
	cd ${pkgname} #-${pkgver}
	make
}

package() {
	cd ${pkgname} #-${pkgver}
	make DESTDIR="${pkgdir}" install-rc

	# iputils-specific configuration
	mkdir -p "$pkgdir/usr/lib/sysctl.d"
	echo "net.ipv4.ping_group_range = 0 2147483647" > "$pkgdir/usr/lib/sysctl.d/55-iputils.conf"
}
