# Maintainer: Torr <torr@artixlinux.org>
pkgname=libayatana-indicator
pkgver=0.9.3
pkgrel=1
pkgdesc="Ayatana Indicators Shared Library"
arch=("x86_64")
url="https://github.com/AyatanaIndicators/libayatana-indicator"
## File: https://github.com/AyatanaIndicators/libayatana-indicator/blob/main/NEWS
changelog=Changelog.txt
license=("GPL3")
depends=(
	"gtk3>=3.24"
	"glib2>=2.37"

	"ayatana-ido"
)
makedepends=(
	"gcc"
	"make"
	"pkgconf"

	"cmake>=3.13"
	"vala"
	"gobject-introspection"
)
source=(
	"https://github.com/AyatanaIndicators/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"09c5456fcb430b6ee0626fafdf99a32eb8746b267d56ab2bd4c8a8dd6ca731da"
)

build() {
	cd "$pkgname-$pkgver"
	cmake -D CMAKE_BUILD_TYPE="MinSizeRel" \
		-D CMAKE_INSTALL_PREFIX="/usr" \
		.
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
