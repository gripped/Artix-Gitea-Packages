# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dbus-dinit
pkgver=20230906
pkgrel=4
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
sha256sums=('93aa013b205830226fcb474a378152e59ce94a75a770c2396db6c165d482ad46'
            '7e7a317bf1cc7ffd988103df4651c37f075097b92261e159911e1b10e0b9f158'
            '3019dae0efc3c1b8fa29a496147b9ae15cd7249b0ced27788932339c0f5a1c29'
            '81360807d31b2440f78631bb68ef0778576b8b0d297b5b16115ad8807f074bc5'
            'SKIP')

package() {
    install -Dm644 dbus            "$pkgdir/etc/dinit.d/dbus"
    install -Dm644 dbus-pre        "$pkgdir/etc/dinit.d/dbus-pre"
    install -Dm755 dbus.script     "$pkgdir/usr/lib/dinit/dbus"
    install -Dm755 dbus-pre.script "$pkgdir/usr/lib/dinit/pre/dbus"

    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_dbus
}
