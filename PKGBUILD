# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_pkgname=userspawn

_alpm=2.4.6

pkgname=userspawn-dinit
pkgver=1.1.0
pkgrel=1
pkgdesc='Launch anything, upon any user login'
arch=('x86_64')
url='https://github.com/Mayware/userspawn'
license=('LGPL-3.0-or-later')
makedepends=('cmake' 'git' 'ninja')
depends=(
    'dbus'
    'dinit-base'
    'libstdc++'
    'libgcc'
    'glibc'
    'sh'
)
provides=(
    'init-userspawn'
    'dinit-user-spawn'
)
conflicts=(
    'init-userspawn'
    'dinit-user-spawn'
)
# replaces=(
#     'dinit-user-spawn'
# )
source=(
    "git+$url.git#tag=v$pkgver"
    "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
    'userspawn.dinit'
    'userspawnrc'
)
sha256sums=('29970fec753883a5343677e069d9442835551f992d0e848540c6975db047705b'
            '934d6f553f3bd6e941449f8700ae7f427182b4ed1e736b42bfb095da78df72a5'
            'd8c25ab527c654c6c6c808033a7575165c54f2a834e92e0a7b7f55ded22f0fce'
            '67e9cc520c4d0f5dc57ec7219b21ed8db8723c128043a5902426408430afaeda')

_backports=(
)

_reverts=(
)

prepare() {
    cd "$_pkgname"

    local _c
    for _c in "${_backports[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done
    for _c in "${_reverts[@]}"; do
        git log --oneline -1 "${_c}"
        git revert -n "${_c}"
    done
}

build() {
    cmake -B build -S "$_pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm755 userspawnrc "$pkgdir"/etc/xdg/userspawn/userspawnrc
    install -Dm644 userspawn.dinit "$pkgdir"/usr/lib/dinit.d/userspawn

    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user install_userspawn_dinit
}
