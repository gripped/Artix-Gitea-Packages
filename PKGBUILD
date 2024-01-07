# Maintainer: Torr <torr@artixlinux.org>
pkgname=btop
pkgver=1.3.0
pkgrel=1
pkgdesc="A monitor of resources"
arch=("x86_64")
url="https://github.com/aristocratos/btop"
## File: https://github.com/aristocratos/btop/blob/main/CHANGELOG.md
changelog=Changelog.txt
license=("Apache2")
depends=("gcc-libs")
makedepends=(
	"gcc>=10.0.0"
	"make"
	"sed"
	"coreutils"
)
source=(
	"https://github.com/aristocratos/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	"375e078ce2091969f0cd14030620bd1a94987451cf7a73859127a786006a32cf"
)

build() {
	cd "$pkgname-$pkgver"
	make ADDFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
	cd "$pkgname-$pkgver"
	make install PREFIX="$pkgdir/usr"
	make setuid PREFIX="$pkgdir/usr"
}
