# Maintainer: Torr <torr@artixlinux.org>
pkgname=timew
pkgver=1.6.0
_libshared_c="d61b41fcaf6fcafc0f843f8b6923edf96642f827"
pkgrel=1
pkgdesc="Commandline Time Tracking and Reporting"
arch=("x86_64")
url="https://timewarrior.net"
## File: https://github.com/GothenburgBitFactory/timewarrior/blob/develop/ChangeLog
changelog=Changelog.txt
license=("MIT")
depends=("gcc-libs")
makedepends=(
	"gcc"
	"make"
	"cmake>=2.8.12"
	"asciidoctor"
)
source=(
	"https://github.com/GothenburgBitFactory/timewarrior/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/GothenburgBitFactory/libshared/archive/$_libshared_c.tar.gz"
)
sha256sums=(
	"fd49d32c93318fa86ddd7a1e440dc36b099d0fcf39b2085d255305ea7d0de438"
	"1c2c44afdac65c937d7cc2f65b5c3a62cc492d02c5e2f9eb53c24e879d24a554"
)

prepare() {
	rm -rf "timewarrior-$pkgver/src/libshared"
	ln -sr "libshared-$_libshared_c" "timewarrior-$pkgver/src/libshared"
}

build() {
	cd "timewarrior-$pkgver"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "timewarrior-$pkgver"
	make install DESTDIR="$pkgdir"
}
