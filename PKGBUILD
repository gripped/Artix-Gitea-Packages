# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: initMayday <initMayday@protonmail.com>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_alpm=2.4.3

pkgname="dinit-user-spawn"
pkgver=1.0.0
pkgrel=11
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
    'dinit-base>=0.19.4-8'
)
conflicts=(
    'dinit<=0.19.4-7' # dbus hook
    'turnstile-dinit'
    'dinit-user-services'
)
provides=(
    'dinit-user-services'
)
source=("git+$url.git#tag=v${pkgver}"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm")
sha256sums=('ef739d7084dca2bc81af3e3ce53de5af3b02e2d868d8e8c906ac233cf7441909'
            '251fd0c4049b09fbfbc212c614240f801692bc23a6148e4d5797cddc85bfe693')

build() {
    artix-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
    #install -Dm644 $pkgname/dinit-user-spawn.service "$pkgdir"/etc/dinit.d/dinit-user-spawn
    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user install_dinit_user_spawn
    install -Dm644 "$pkgname"/dinit-user-spawn.service "$pkgdir"/usr/lib/dinit.d/dinit-user-spawn
}
