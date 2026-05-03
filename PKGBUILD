# Maintainer: Capezotte <capezotte@artixlinux.org>

pkgname=chcgs
pkgver=0.1
pkgrel=1
pkgdesc="Daemonless and painless management of Linux cgroups"
arch=(x86_64)
url="https://codeberg.org/Capezotte/chcgs"
license=('ISC')
depends=('skalibs')
makedepends=('git')
source=("git+https://codeberg.org/Capezotte/chcgs.git#tag=v${pkgver}")
sha256sums=('346b1bf4bc1fecfd142a8d466c6daad26fc6c11f3a2b813f8ba0f3dc48fc7dc0')
# validpgpkeys=('4018CBA95CA2BA1436BF623170928BEA88CDC7EE') FIXME

build() {
	cd "$pkgname"

	make
}

package() {
	cd "$pkgname"

	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
