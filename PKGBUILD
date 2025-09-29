# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artix/qt-sudo

pkgname=qt-sudo
pkgver=2.2.0
pkgrel=1
pkgdesc='A clone of LXQt sudo tool, without LXQt libs '
arch=('x86_64')
license=('LGPL-2.1-only')
url="https://github.com/aarnt/qt-sudo"
makedepends=(
    qt6-tools
    cmake
    git
)
depends=(
    glibc
    gcc-libs
    qt6-base
)
source=(
    "git+$url.git#tag=v$pkgver"
    "$pkgname-cmake.patch::$_url/commit/ab4e3dd18ee028791218e3b8551728a0fb115c92.patch"
)
sha256sums=('4bceaba9eda795b504263377be880954b57e9416bf8cae3abea7b2674733fbe0'
            'f0dff2b306d853edf2e66546813bf4263c332a7390c08a2edb47fea96da49ae3')

prepare() {
    git -C "$pkgname" apply ../$pkgname-cmake.patch
    sed -e "s|2.0.0|$pkgver|" -i "$pkgname"/CMakeLists.txt
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
