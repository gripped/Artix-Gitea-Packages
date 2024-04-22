# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-notificationd
pkgver=2.0.0
pkgrel=1
pkgdesc="LXQt notification daemon and library."
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("qt6-base" "liblxqt" "kwindowsystem" "libQt6Xdg.so" "layer-shell-qt")
makedepends=("cmake" "lxqt-build-tools")
provides=("notification-daemon")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha512sums=('d1fce66bea535d65964cfaf12d8712424c861dd1309f492e7a00e678bdb18d19e921ea5a49ed6a03f0c96ddccfcb4f56131bcd26861d15b90564b8eddde7754d'
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
