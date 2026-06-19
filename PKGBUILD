# Maintainer: capezotte <capezotte@artixlinux.org>

pkgname=tuned-openrc
pkgver=20260619
pkgrel=1
pkgdesc="openrc service script for tuned"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-apps/tuned"
groups=('openrc-galaxy')
license=('GPL-2.0-only')
depends=(tuned)
provides=(init-tuned)
conflicts=(init-tuned)
source=(tuned.initd)
sha256sums=('ee234417a3db82a1129a8fffccf3028da97ee21fbf802ecdc0e21fbbe5145883')

package() {
	install -Dm755 tuned.initd "$pkgdir"/etc/init.d/tuned
}
