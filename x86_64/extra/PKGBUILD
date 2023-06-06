# Maintainer: Torr <torr@artixlinux.org>
pkgname=btop
pkgver=1.2.13
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
	"668dc4782432564c35ad0d32748f972248cc5c5448c9009faeb3445282920e02"
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
