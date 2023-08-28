# Maintainer: Torr <torr@artixlinux.org>
pkgname=ayatana-ido
pkgver=0.10.1
pkgrel=1
pkgdesc="Ayatana Indicator Display Objects"
arch=("x86_64")
url="https://github.com/AyatanaIndicators/ayatana-ido"
## File: https://github.com/AyatanaIndicators/ayatana-ido/blob/main/NEWS
changelog=Changelog.txt
license=("LGPL3")
depends=(
	"gtk3>=3.24"
	"glib2>=2.58"
)
makedepends=(
	"gcc"
	"make"
	"pkgconf"

	"cmake>=3.13"
	"gobject-introspection"
	"vala"

)
source=(
	"https://github.com/AyatanaIndicators/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"26187915a6f3402195e2c78d9e8a54549112a3cd05bb2fbe2059d3e78fc0e071"
)

build() {
	cd "$pkgname-$pkgver"
	cmake -D CMAKE_INSTALL_PREFIX="/usr" .
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
