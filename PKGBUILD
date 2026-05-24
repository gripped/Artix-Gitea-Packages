# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: initMayday <initMayday@protonmail.com>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_alpm=2.4.5

pkgname="dinit-user-spawn"
pkgver=1.0.4
pkgrel=2
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
    bash
    glibc
    libgcc
    libstdc++
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
sha256sums=('f93a78fd09a8aa9fc869aa4d0c89aa1955614c74ad6fce8066e07f332b8a7502'
            '987e908f28a06ef4c577e4dda286d9111a226837c92d44b659ca8b164caf9ea4')

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
