# Maintainer: Torr <torr@artixlinux.org>
pkgname=timew
pkgver=1.7.1
_ver_c="1882058c5ee1e8b6cbcd5335536b1efca8935823"
_libshared_c="35e6ec09595c80bc744a27eda50e4dd34d6c7303"
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
	"https://github.com/GothenburgBitFactory/timewarrior/archive/$_ver_c.tar.gz"
	"https://github.com/GothenburgBitFactory/libshared/archive/$_libshared_c.tar.gz"
)
sha256sums=(
	"e1b61a178c00cad4432100a2d3be2e2afe0b94a0a515bae4c2d4c278cac6e114"
	"1cf21842b917ac5440d4f5ba0477a097df816f6570372bbc90e043b3ec238fd3"
)

prepare() {
	rm -rf "timewarrior-$_ver_c/src/libshared"
	ln -sr "libshared-$_libshared_c" "timewarrior-$_ver_c/src/libshared"
}

build() {
	cd "timewarrior-$_ver_c"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "timewarrior-$_ver_c"
	make install DESTDIR="$pkgdir"
}
