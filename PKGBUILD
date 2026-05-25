# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_pkgname=userspawn

_alpm=2.4.6

pkgname=userspawn-dinit
pkgrel=1
pkgver=1.0.0
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
replaces=(
    'dinit-user-spawn'
)
source=(
    "git+$url.git#tag=v$pkgver"
    "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
    'userspawn.dinit'
)
sha256sums=('4ef5491ce4abe731570ebe1eb4618b7ecdfff6d9634ad218fa4d117a24c59215'
            '934d6f553f3bd6e941449f8700ae7f427182b4ed1e736b42bfb095da78df72a5'
            'd8c25ab527c654c6c6c808033a7575165c54f2a834e92e0a7b7f55ded22f0fce')

build() {
    cmake -B build -S "$_pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 $srcdir/userspawn.dinit "$pkgdir"/usr/lib/dinit.d/userspawn

    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user install_userspawn_dinit
}
