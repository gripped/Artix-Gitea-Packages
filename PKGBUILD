# Maintainer: Torr <torr@artixlinux.org>
pkgname=task
pkgver=2.6.2
_libshared_c="35e6ec09595c80bc744a27eda50e4dd34d6c7303"
pkgrel=1
pkgdesc="Command line Task Management"
arch=("x86_64")
url="https://taskwarrior.org"
## File: https://github.com/GothenburgBitFactory/taskwarrior/blob/develop/ChangeLog
changelog=Changelog.txt
license=("MIT", "custom")
depends=(
	"util-linux-libs"  ## libuuid
	"gnutls"
)
makedepends=(
	"gcc>7.1"
	"make"
	"cmake>=3.0"
)
optdepends=(
	"perl: for the 'update-holidays' add-on"
)
source=(
	"https://github.com/GothenburgBitFactory/taskwarrior/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/GothenburgBitFactory/libshared/archive/$_libshared_c.tar.gz"
)
sha256sums=(
	"779ff60d104f189f9dbbaa40c95d2de45a53bb3bdeddeeb527eaaf3ae3ffbc5a"
	"1cf21842b917ac5440d4f5ba0477a097df816f6570372bbc90e043b3ec238fd3"
)

prepare() {
	rm -rf "taskwarrior-$pkgver/src/libshared"
	ln -sr "libshared-$_libshared_c" "taskwarrior-$pkgver/src/libshared"
}

build() {
	cd "taskwarrior-$pkgver"
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=release .
	make
}

package() {
	cd "taskwarrior-$pkgver"
	make install DESTDIR="$pkgdir"

	rm -rf $pkgdir/usr/share/doc/task/scripts/{bash,fish,zsh}
	install -Dm 644 scripts/bash/task.sh "$pkgdir/share/bash-completion/completions/task"
	install -Dm 644 scripts/fish/task.fish "$pkgdir/usr/share/fish/vendor_completions.d/task.fish"
	install -Dm 644 scripts/zsh/_task -t "$pkgdir/share/zsh/site-functions"

	install -Dm 644 LICENSE COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
