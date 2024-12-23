# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=lxqt-session
pkgver=2.1.0
pkgrel=3.1
pkgdesc="The LXQt session manager"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("liblxqt" "qtxdg-tools" "xdg-user-dirs"  "libx11" "udev" "kwindowsystem" "libQt6Xdg.so" "procps-ng" "libproc2.so" "layer-shell-qt"
         "ttf-font")
makedepends=("cmake" "lxqt-build-tools")
optdepends=(
	"breeze-icons: Default icon theme"
	"oxygen-icons: Alternative icon theme"
	"sddm: The recommended display manager"
)
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
	'0001-Adopt-API-changes-for-procps-ng-4.0.5.patch'
)
sha256sums=('b745ef14afec4bed788aeb2d448861fbc0c6f738c1ce956f4a6450f6c745270b'
            'SKIP'
            '5359beecfa28ffee9747912f130d21980a1733e6be02b87c610d067d97e3b0e3')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -Np1 < ../0001-Adopt-API-changes-for-procps-ng-4.0.5.patch
}

build() {
	cmake -S "$srcdir/$pkgname-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
