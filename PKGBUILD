# Maintainer: Torr <torr@artixlinux.org>
pkgname=ayatana-ido
pkgver=0.10.2
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
	"0daf8a2e5bba51225bc3724c0e53c3b569269f28ac3a14f6bed9920b44ecc856"
)

build() {
	cd "$pkgname-$pkgver"
	export HOME=/tmp
	cmake -D CMAKE_INSTALL_PREFIX="/usr" .
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
