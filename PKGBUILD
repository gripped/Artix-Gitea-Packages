# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_alpm=2.4.6

pkgname=userspawn-dinit
pkgver=20260527
pkgrel=1
pkgdesc='dinit service script for userspawn'
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
optdepends=(
    'wireplumber-dinit: dinit user service script for wireplumber'
    'pipewire-pulse-dinit: dinit user service script for pipewire-pulse'
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
backup=(
    'etc/xdg/userspawn/userspawnrc'
)
# replaces=(
#     'dinit-user-spawn'
# )
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

    install -d "$pkgdir"/etc/dinit.d/boot.d/
    install -m644 userspawn.dinit "$pkgdir"/etc/dinit.d/userspawn
    ln -s ../userspawn "$pkgdir"/etc/dinit.d/boot.d/

    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user #install_userspawn_dinit
}
