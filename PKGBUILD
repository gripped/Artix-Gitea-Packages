pkgname=libayatana-appindicator
pkgver=0.5.94
pkgrel=1
pkgdesc="Ayatana Application Indicators Shared Library"
arch=("x86_64")
url="https://github.com/AyatanaIndicators/libayatana-appindicator"
## File: https://github.com/AyatanaIndicators/libayatana-appindicator/blob/master/NEWS
changelog=Changelog.txt
license=("LGPL2.1" "LGPL3")
depends=(
	"gcc-libs"
	"libayatana-indicator>=0.8.4"
	"glib2>=2.58"
	"gtk3>=3.24"
	"libdbusmenu-gtk3>=0.4"
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
sha256sums=('884a6bc77994c0b58c961613ca4c4b974dc91aa0f804e70e92f38a542d0d0f90')

build() {
	cd "$pkgname-$pkgver"
	cmake -D CMAKE_BUILD_TYPE="MinSizeRel" \
		-D CMAKE_INSTALL_PREFIX="/usr" \
		-D ENABLE_BINDINGS_MONO=OFF \
		.
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

