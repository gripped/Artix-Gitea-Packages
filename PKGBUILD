# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=dinit
pkgname=('dinit' 'dinit-base')
pkgver=0.17.0
_pkgver=0.17
_commit=29cd296aa4635fe6f7b53bda2f2cb1648bdc0782
pkgrel=1
pkgdesc="Service monitoring/init system"
arch=('x86_64')
url="https://github.com/davmac314/dinit"
license=('Apache')
makedepends=('git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('f3ce6eaaabd571edc16f54907cd6062f22ed5d4b6f9ae6fc1c6533f39469b1f0'
            'SKIP')

build() {
	cd "$pkgname-$_pkgver"
	make
}

package_dinit-base() {
	pkgdesc='Service monitoring/init system -- base package'
	install=dinit.install
	cd "$pkgbase-$_pkgver"
	make DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=no install
}

package_dinit() {
	pkgdesc='Service monitoring/init system -- init package'
	depends=('dinit-base' 'dinit-rc')
	provides=('svc-manager')
	conflicts=('svc-manager')
	cd "$pkgbase-$_pkgver"
	make DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=yes install

	# remove dinit-base pkgs
	rm -f "$pkgdir/usr/bin/"{dinit,dinitcheck,dinitctl,dinit-monitor}
	rm -rf "$pkgdir/usr/share/man/man5"
	rm -f "$pkgdir/usr/share/man/man8/"{dinit,dinitcheck,dinitctl,dinit-monitor}.8

	# dinit-init symlink
	ln -s dinit "$pkgdir/usr/bin/dinit-init"

	cd "$srcdir/alpm-hooks"
	make DESTDIR="$pkgdir/" install_dinit
}
