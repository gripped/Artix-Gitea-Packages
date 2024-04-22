# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=libfm-qt
pkgver=2.0.0
pkgrel=1
pkgdesc="Core library of PCManFM-Qt (Qt binding for libfm)"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("menu-cache" "libexif" "qt6-base" "lxqt-menu-data")
makedepends=("lxqt-build-tools")
optdepends=(
  "org.freedesktop.secrets: allow to remember mount passwords"
)
provides=("libfm-qt6.so")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha512sums=('0f58a144ec8bcebfabef2bd083a08f04d6832cc16ec0d1093bda72495def64da3172292934aa561cda88ddc289e29d9ee13e3582a8a5a48ac20cbcf3fee57524'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)
# Work-around https://gitlab.kitware.com/cmake/cmake/-/issues/17122
# Relevant CMake codes: https://github.com/lxqt/libfm-qt/blob/1.2.1/src/CMakeLists.txt#L179
options=('!emptydirs')

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
