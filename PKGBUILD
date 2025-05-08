# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlang
pkgver=0.6.2
pkgrel=1
pkgdesc='implementation library for the hypr config language'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         hyprutils libhyprutils.so)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('60952d34c637193e0831da1354afa9bc4f276b132dcd3565d05db40776919c3d')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
