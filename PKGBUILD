# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_alpm=2.4.6

pkgname=userspawn-dinit
pkgver=20260526
pkgrel=2
pkgdesc='Launch anything, upon any user login'
arch=('any')
url='https://github.com/Mayware/userspawn'
license=('LGPL-3.0-or-later')
makedepends=(
    'git'
)
depends=(
    'userspawn'
    'dbus-dinit'
    'dinit-base'
    'sh'
)
provides=(
    'init-userspawn'
    'dinit-user-spawn'
)
conflicts=(
    'init-userspawn'
    'dinit-user-spawn'
    'turnstile-dinit'
)
replaces=(
    'dinit-user-spawn'
)
source=(
    "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
    'userspawn.dinit'
    'userspawnrc'
)
sha256sums=('934d6f553f3bd6e941449f8700ae7f427182b4ed1e736b42bfb095da78df72a5'
            'd8c25ab527c654c6c6c808033a7575165c54f2a834e92e0a7b7f55ded22f0fce'
            '67e9cc520c4d0f5dc57ec7219b21ed8db8723c128043a5902426408430afaeda')

package() {
    install -Dm755 userspawnrc "$pkgdir"/etc/xdg/userspawn/userspawnrc
    install -Dm644 userspawn.dinit "$pkgdir"/usr/lib/dinit.d/userspawn

    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user install_userspawn_dinit
}
