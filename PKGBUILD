# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: kingdomkind <kingdomkind@protonmail.com>

_alpm=2.4.6

pkgname=userspawn-dinit
pkgver=20260621
pkgrel=2
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
replaces=(
    'dinit-user-spawn'
)
source=(
    "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
    'userspawn.dinit'
    'userspawnrc'
    'boot.user'
)
sha256sums=('934d6f553f3bd6e941449f8700ae7f427182b4ed1e736b42bfb095da78df72a5'
            'd8c25ab527c654c6c6c808033a7575165c54f2a834e92e0a7b7f55ded22f0fce'
            'faff6a588e7a2bcc2f8ec9aa0e92ecc23993b5d1e744db564e9f665897149ccf'
            '48fcee93339f496f9d0330cd71540c6cb301a287160a229b11e42a2a34dc5a6f')

package() {
    install -d "$pkgdir"/etc/{dinit.d/boot.d,xdg/userspawn/dinit.d/boot.d}
    install -m755 userspawnrc "$pkgdir"/etc/xdg/userspawn/userspawnrc
    install -m644 boot.user "$pkgdir"/etc/xdg/userspawn/dinit.d/boot

    install -m644 userspawn.dinit "$pkgdir"/etc/dinit.d/userspawn
    ln -s ../userspawn "$pkgdir"/etc/dinit.d/boot.d/

    make -C alpm-hooks DESTDIR="$pkgdir/" install_dinit_user
}
