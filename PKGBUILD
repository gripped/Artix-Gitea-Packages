# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=backlight-dinit
pkgver=20211101
pkgrel=5
pkgdesc="dinit service scripts for backlight"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit')
conflicts=('init-backlight')
provides=('init-backlight')
source=("backlight" "backlight.script")
sha256sums=('9b65775d8a22e98e43dea85eb5493f7540a014820fdb896cc94202ecb1ef412b'
            '2af6767979264b9024c565351e26ce0570e2734a84c1eb914596e8c54d4566fb')

package() {
    install -Dm644 backlight        "$pkgdir/etc/dinit.d/backlight"
    install -Dm755 backlight.script "$pkgdir/usr/lib/dinit/backlight"
}
