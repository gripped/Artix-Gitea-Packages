# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artoo/qt-sudo

pkgname=qt-sudo
pkgver=1.0
pkgrel=1
pkgdesc='A clone of LXQt sudo tool, without LXQt libs '
arch=('x86_64')
license=('LGPL-2.1-only')
url="https://github.com/aarnt/qt-sudo"
makedepends=(
    qt6-tools
    cmake
    sudo
    git
)
depends=(
    glibc
    gcc-libs
    qt6-base
)
source=(
    "git+$url.git"
    "$pkgname-cmake-support.patch::$_url/commit/9beaf2505fb3defd58f3f410acd976527545bdcc.patch"
)
sha256sums=('SKIP'
            'aa3fe399640948c0856030c260c6311f3042836901fc313a1da938d91c1378f6')

prepare() {
    cd "$pkgname"
    git apply ../$pkgname-cmake-support.patch
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
