# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgbase=dbus-dinit
pkgname=('dbus-dinit' 'dbus-dinit-user')
pkgver=20240610
pkgrel=1
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('dbus')
makedepends=('git')
_commit=d2362e98e56dfe11308d1526c40f91f717e19a24
source=("dbus" "dbus.script" "dbus-pre" "dbus-pre.script" "dbus.user" "dbus.user.script"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('1d0b36a9e6abf63d484758a2a2922b283a7c7b63adacf548b1106e7fcab3f469'
            '7e7a317bf1cc7ffd988103df4651c37f075097b92261e159911e1b10e0b9f158'
            'dcdc5ccc253857abb2e7fd778eabd1e32f0a2352c7738e9de89c71894f16b3b3'
            '85cbc58956b09d06372fad6cdb7ee5e40f799ef38e573541739181062a51fe3e'
            'bfbca3e14eb60a046baadecd6dff0ee372427a863482b9d4100d57f46cbb6e1a'
            '6b176d6d078d643ace03008f02b07bcc57367417f1ca808c3cb9c1e954e74d98'
            '18fb90ccebe8afe49264404d3a4425a6c274a0e05ae8af90d9492eb733bac30c')

package_dbus-dinit() {
    pkgdesc="dinit service scripts for dbus"
    depends+=('dinit')
    provides=('init-dbus')
    conflicts=('init-dbus')
    groups=('dinit-system')
    install -Dm644 dbus            "$pkgdir/etc/dinit.d/dbus"
    install -Dm644 dbus-pre        "$pkgdir/etc/dinit.d/dbus-pre"
    install -Dm755 dbus.script     "$pkgdir/usr/lib/dinit/dbus"
    install -Dm755 dbus-pre.script "$pkgdir/usr/lib/dinit/pre/dbus"

    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_dbus
}

package_dbus-dinit-user() {
    pkgdesc="dinit user service scripts for dbus"
    depends+=('turnstile' 'dinit-base')
    groups=('dinit-user-services')
    install -Dm644 dbus.user        "$pkgdir/etc/dinit.d/user/dbus"
    install -Dm644 dbus.user.script "$pkgdir/usr/lib/dinit/user/dbus"

    # run the user service script by default, this will make our dbus behaviour closer
    # to that of Arch (or systemd distros in general)
    install -d                      "$pkgdir/usr/lib/dinit.d/user/boot.d"
    ln -s /etc/dinit.d/user/dbus    "$pkgdir/usr/lib/dinit.d/user/boot.d/dbus"
}
