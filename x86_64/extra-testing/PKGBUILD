# Maintainer: Torr <torr@artixlinux.org>
pkgname=ayatana-ido
pkgver=0.10.0
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
	"cmake>=3.13"
	"pkgconf"
	"gobject-introspection"
	"vala"

)
source=(
	"https://github.com/AyatanaIndicators/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"d6ec310572de38c6b5c4ca9ff0979366a3c783af14bb47113cab5da7d5946fa7"
)

build() {
	cd "$pkgname-$pkgver"
	cmake -D CMAKE_INSTALL_PREFIX="/usr" .
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
