# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprshutdown
pkgver=0.1.0
pkgrel=2
pkgdesc='A graceful shutdown utility for Hyprland '
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(glaze
         glibc # libc.so libm.so
         hyprtoolkit libhyprtoolkit.so
         hyprutils libhyprutils.so
         libdrm # libdrm.so
         libgcc libgcc_s.so
         libstdc++ libstdc++.so
         pixman)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('28b125c6d8406029b59beacb77aa080d5d8905239b1006c94c7307f1997e6819')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake -B build -W no-dev ${cmake_options[@]}
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
