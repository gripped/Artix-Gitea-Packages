# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=dinit
pkgname=('dinit' 'dinit-base')
pkgver=0.18.0
_commit=29cd296aa4635fe6f7b53bda2f2cb1648bdc0782
pkgrel=3
pkgdesc="Service monitoring/init system"
arch=('x86_64')
url="https://github.com/davmac314/dinit"
license=('Apache')
makedepends=('git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit"
        "dinit-init")
sha256sums=('16f70d6ad3ba3ec5c709c810fbfb009f65e41c0b95d32b3725ae88e477b1c48a'
            'SKIP'
            '8b9a5a6b1a917a4669b75a168ebd6c5b3a9734e7c11da0f2ec1c57058279195d')

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
