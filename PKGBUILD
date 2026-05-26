# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

pkgname=userspawn
pkgver=1.1.0
pkgrel=2
pkgdesc='Launch anything, upon any user login'
arch=('x86_64')
url='https://github.com/Mayware/userspawn'
license=('LGPL-3.0-or-later')
makedepends=(
    'cmake'
    'git'
    'ninja'
)
depends=(
    'dbus'
    'libstdc++'
    'libgcc'
    'glibc'
)
source=(
    "git+$url.git#tag=v$pkgver"
)
sha256sums=('29970fec753883a5343677e069d9442835551f992d0e848540c6975db047705b')

_backports=(
)

prepare() {
    cd "$pkgname"

    local _c
    for _c in "${_backports[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done
}

build() {
    cmake -B build -S "$pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
