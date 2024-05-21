# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=deluge-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for deluge"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'deluge')
provides=('init-deluge')
conflicts=('init-deluge')
source=("deluged"
        "deluge-web")
sha256sums=('a38527f8dae0ba3eb2c415d9a9360bc23e39d41331e06e4ff1670610ca798925'
            'be8fd185169b6423855e83f004269e0062c491ddcfb1ff2530e519f7b70fb6b6')

package() {
    install -Dm644 deluged    "$pkgdir/etc/dinit.d/deluged"
    install -Dm644 deluge-web "$pkgdir/etc/dinit.d/deluge-web"
}
