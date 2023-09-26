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
sha512sums=(
	# "fd49d32c93318fa86ddd7a1e440dc36b099d0fcf39b2085d255305ea7d0de438"
	# "1c2c44afdac65c937d7cc2f65b5c3a62cc492d02c5e2f9eb53c24e879d24a554"
	"9030cb5971724614ebb5d1f13f18849ea02fa821024bbf42d98c90fdb2b1c8de72f829c8a31ffb1798fb74b3c0e1070967112283b4f834c534bc9129dba08317"
	"9b3c8a15179edfcdbdc246f08dd8ab2fe7f9c51379e9a389c1c929a2b9439cfc6a3d763942f9fde30a7f96f41261b5211fb49a43908deadf907bf6336027996f"
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
