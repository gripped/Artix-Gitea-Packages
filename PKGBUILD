# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dbus-dinit
pkgver=20240421
pkgrel=3
pkgdesc="dinit service scripts for dbus"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('dbus' 'dinit')
makedepends=('git')
provides=('init-dbus')
conflicts=('init-dbus')
groups=('dinit-system')
_commit=d2362e98e56dfe11308d1526c40f91f717e19a24
source=("dbus" "dbus.script" "dbus-pre" "dbus-pre.script"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('e133d7d2d1e68dc15a83872231244e5a681a4f1617be85faee52a5749c8179b1'
            '7e7a317bf1cc7ffd988103df4651c37f075097b92261e159911e1b10e0b9f158'
            '4a24eb7372590140f942b642d6fcd88c3fbe2590e8eff9a47f41431a23a1fdf5'
            '85cbc58956b09d06372fad6cdb7ee5e40f799ef38e573541739181062a51fe3e'
            '18fb90ccebe8afe49264404d3a4425a6c274a0e05ae8af90d9492eb733bac30c')

package() {
    install -Dm644 dbus            "$pkgdir/etc/dinit.d/dbus"
    install -Dm644 dbus-pre        "$pkgdir/etc/dinit.d/dbus-pre"
    install -Dm755 dbus.script     "$pkgdir/usr/lib/dinit/dbus"
    install -Dm755 dbus-pre.script "$pkgdir/usr/lib/dinit/pre/dbus"

    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_dbus
}
