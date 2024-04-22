# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=lximage-qt
pkgver=2.0.0
pkgrel=1
pkgdesc="The LXQt image viewer and screenshot tool"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("GPL2")
depends=("lxqt-themes" "libfm-qt" "qt6-svg" "libexif" "libxfixes" "libfm-qt6.so")
optdepends=(
	"qt6-imageformats: support for additional image formats (WEBP, TIFF, etc.)"
	"kimageformats: support for additional image formats (PCX, XCF, HEIF, etc.)"
)
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha256sums=('cb9cc0691bfa5e5ec4172db13467485158e0d5433b90fd098a692b38a8f6c028'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
