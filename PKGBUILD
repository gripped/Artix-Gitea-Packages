# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

_alpm=2.3

pkgname=dbus-dinit
pkgver=20250815
pkgrel=3
pkgdesc="dinit service scripts for dbus"
arch=('any')
url="https://gitea.artixlinux.org/packages/dbus-dinit"
license=('BSD-2-Clause')
groups=('dinit-system')
depends=(
    'dbus'
    'dinit'
    'sh'
)
provides=(
    'init-dbus'
    'dbus-dinit-user'
)
conflicts=(
    'init-dbus'
    'dbus-dinit-user'
)
replaces=(
    'dbus-dinit-user'
)
makedepends=(
    'git'
)
source=(
    "dbus"{,.script}
    "dbus-pre"{,.script}
    "dbus.user"{,.script}
    "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
    LICENSE
)
sha256sums=('1d0b36a9e6abf63d484758a2a2922b283a7c7b63adacf548b1106e7fcab3f469'
            '7e7a317bf1cc7ffd988103df4651c37f075097b92261e159911e1b10e0b9f158'
            'dcdc5ccc253857abb2e7fd778eabd1e32f0a2352c7738e9de89c71894f16b3b3'
            '85cbc58956b09d06372fad6cdb7ee5e40f799ef38e573541739181062a51fe3e'
            'bfbca3e14eb60a046baadecd6dff0ee372427a863482b9d4100d57f46cbb6e1a'
            '6b176d6d078d643ace03008f02b07bcc57367417f1ca808c3cb9c1e954e74d98'
            '135a4df3c384cc79feed39d265a80ca0e5a8278bd4367d34b90f174f41384e1e'
            '82a1fe4e9658a20b47051e17a25be3a97bab088202df1079a206d64003e99832')

package() {
    install -Dm644 dbus            "$pkgdir"/etc/dinit.d/dbus
    install -Dm644 dbus-pre        "$pkgdir"/etc/dinit.d/dbus-pre
    install -Dm755 dbus.script     "$pkgdir"/usr/lib/dinit/dbus
    install -Dm755 dbus-pre.script "$pkgdir"/usr/lib/dinit/pre/dbus

    make -C "alpm-hooks" DESTDIR="$pkgdir" install_dinit_dbus

    install -Dm644 dbus.user        "$pkgdir"/etc/dinit.d/user/dbus
    install -Dm755 dbus.user.script "$pkgdir"/usr/lib/dinit/user/dbus

    # run the user service script by default, this will make our dbus behaviour closer
    # to that of Arch (or systemd distros in general)
    install -d                      "$pkgdir"/usr/lib/dinit.d/user/boot.d
    ln -s /etc/dinit.d/user/dbus    "$pkgdir"/usr/lib/dinit.d/user/boot.d/dbus

    install -Dm0644 -t "$pkgdir"/usr/share/licenses/$pkgname/ LICENSE
}

