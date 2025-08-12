# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: initMayday <initMayday@protonmail.com>

pkgname="dinit-user-spawn"
pkgver=1.0.0
pkgrel=2
pkgdesc='Launches a user process dinit for you on login'
arch=('x86_64')
url='https://github.com/initMayday/dinit-user-spawn'
groups=('dinit-world')
license=(
    AGPL-3.0-or-later
)
makedepends=(
    meson
    git
)
depends=(
    dinit
    gcc-libs
    glibc
    tomlplusplus
)
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('f8f311afcdcd73567f52188508df7724a92489f205351d40973d3b17025ca0e7')
install='dinit-user-spawn.install'

build() {
    artix-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
    install -Dm644 "$pkgname"/dinit-user-spawn.service "$pkgdir"/usr/lib/dinit.d/dinit-user-spawn
}
