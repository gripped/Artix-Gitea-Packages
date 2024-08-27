pkgname=libayatana-indicator
pkgver=0.9.4
pkgrel=1.1
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
        "glib2-devel"
	"cmake>=3.13"
	"vala"
	"gobject-introspection"
)
source=(
	"https://github.com/AyatanaIndicators/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"a18d3c682e29afd77db24366f8475b26bda22b0e16ff569a2ec71cd6eb4eac95"
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
        mv "${pkgdir}/usr/libexec/libayatana-indicator" "${pkgdir}/usr/lib/"
        rmdir "${pkgdir}/usr/libexec"
}
