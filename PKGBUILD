# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=dinit
pkgname=('dinit' 'dinit-base')
pkgver=0.19.3
_commit=29cd296aa4635fe6f7b53bda2f2cb1648bdc0782
pkgrel=1
pkgdesc="Service monitoring/init system"
arch=('x86_64')
url="https://github.com/davmac314/dinit"
license=('Apache')
makedepends=('git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit"
        "dinit-init")
sha256sums=('3bded3b01ac3af4d187a05f31d0f83cc00facc76625d92148a964245b730e43f'
            'f02a0da232ba3b4fcd91f02ad8cde1ebd117dc21cf8d2c827576887cfa9d1521'
            'e65c299e04c9184dc1f68388670dacc89a4df2445d3f41a640b18dae24eaf03b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package_dinit-base() {
	pkgdesc='Service monitoring/init system -- base package'
	install=dinit.install
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=no install
}

package_dinit() {
	pkgdesc='Service monitoring/init system -- init package'
	depends=('dinit-base' 'dinit-rc')
	provides=('svc-manager')
	conflicts=('svc-manager')
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=yes install

	# remove dinit-base pkgs
	rm -f "$pkgdir/usr/bin/"{dinit,dinitcheck,dinitctl,dinit-monitor}
	rm -rf "$pkgdir/usr/share/man/man5"
	rm -f "$pkgdir/usr/share/man/man8/"{dinit,dinitcheck,dinitctl,dinit-monitor}.8

	# dinit-init symlink
	install -Dm755 "$srcdir/dinit-init" "$pkgdir/usr/bin/dinit-init"

	cd "$srcdir/alpm-hooks"
	make DESTDIR="$pkgdir/" install_dinit
}
