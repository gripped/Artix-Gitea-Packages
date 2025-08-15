# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: initMayday <initMayday@protonmail.com>

pkgname="dinit-user-spawn"
pkgver=1.0.0
pkgrel=5
pkgdesc='Launches a user process dinit for you on login'
arch=('x86_64')
url='https://github.com/initMayday/dinit-user-spawn'
groups=('dinit-system')
license=(
    AGPL-3.0-or-later
)
makedepends=(
    meson
    git
)
depends=(
    gcc-libs
    glibc
    tomlplusplus
)
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('ef739d7084dca2bc81af3e3ce53de5af3b02e2d868d8e8c906ac233cf7441909')

build() {
    artix-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
    install -Dm644 "$pkgname"/dinit-user-spawn.service "$pkgdir"/usr/lib/dinit.d/dinit-user-spawn
}
