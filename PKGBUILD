# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: initMayday <initMayday@protonmail.com>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_alpm=2.4.4

pkgname="dinit-user-spawn"
pkgver=1.0.3
pkgrel=1
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
    bash
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
sha256sums=('d6047df7fb221c175605f651255d2670beed7e50baf762843954f717e9781be2'
            'e33444dba1b0a185eead8460a77f763bc99bca8cb072dbb90e90a29393d4f865')

build() {
    artix-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user install_dinit_user_spawn
    # install -Dm644 $pkgname/dinit-user-spawn.service "$pkgdir"/etc/dinit.d/dinit-user-spawn
    install -Dm644 "$pkgname"/dinit-user-spawn.service "$pkgdir"/usr/lib/dinit.d/dinit-user-spawn
}
