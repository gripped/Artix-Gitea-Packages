# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=backlight-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for backlight"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit')
conflicts=('init-backlight')
provides=('init-backlight')
source=("backlight" "backlight.script")
sha256sums=('a2e99402b248f13ff61982d22060b1ccd9bcc1e21d24480647e5a0d34aa9211b'
            '2af6767979264b9024c565351e26ce0570e2734a84c1eb914596e8c54d4566fb')

package() {
    install -Dm644 backlight        "$pkgdir/etc/dinit.d/backlight"
    install -Dm755 backlight.script "$pkgdir/etc/dinit.d/scripts/backlight"
}
