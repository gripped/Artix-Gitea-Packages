# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=liboctopi
pkgver=1.0.1
pkgrel=2
pkgdesc="Alpm utils for Octopi (alpm_octopi_utils fork)"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/liboctopi"
license=('GPL-3.0-or-later')
depends=(
    glibc
    glib2
    pacman
)
makedepends=(
    cmake
    git
    vala
)
provides=(
    liboctopi.so
    alpm_octopi_utils
    alpm-octopi-utils
)
conflicts=(
    alpm_octopi_utils
    alpm-octopi-utils
)
replaces=(
    alpm_octopi_utils
    alpm-octopi-utils
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('6976f79a0796398b46cff03b34d46018c99a2add42ffa02c6d7ecc8d5bf51697')

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
