# Maintainer: artist for Artix

pkgname=eovim
pkgver=2.0.99
pkgrel=2.1
pkgdesc="EFL powered Neovim GUI"
arch=('x86_64')
url="https://github.com/jeanguyomarch/eovim"
license=('MIT')
depends=('efl' 'neovim' 'msgpack-c')
makedepends=('cmake' 'git' 'python' 'python-jinja')
source=("${pkgname}::git+${url}.git")

prepare() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake \
	-DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
	-DCMAKE_BUILD_TYPE=Release \
	-DLIB_INSTALL_DIR="lib/" \
	..
}

build() {
	cd "$pkgname"
	cmake --build build
}

package() {
	cd "$pkgname"
	cmake --build build --target install
        rm ${pkgdir}/usr/share/icons/eovim.{png,svg}
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha256sums=('SKIP')
