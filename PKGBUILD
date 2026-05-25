# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_pkgname=userspawn

_alpm=2.4.6

pkgname=userspawn-dinit
pkgver=1.0.0
pkgrel=2
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
sha256sums=('4ef5491ce4abe731570ebe1eb4618b7ecdfff6d9634ad218fa4d117a24c59215'
            '934d6f553f3bd6e941449f8700ae7f427182b4ed1e736b42bfb095da78df72a5'
            'd8c25ab527c654c6c6c808033a7575165c54f2a834e92e0a7b7f55ded22f0fce'
            '2395a270d8bde963d6056b01dc7429075500dbc70ab9041a3dbfe010f6c77763')

_backports=(
    34022fbf1e97fee59f91d31285d3552b03108062 # xdg config
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
