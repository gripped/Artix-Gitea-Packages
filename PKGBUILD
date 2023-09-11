# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=deluge-dinit
pkgver=20211030
pkgrel=3
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
sha256sums=('36f639df7fce62d0bf17bf138b066c43c533f3c24d05e3fb1993eeeb6967e9f3'
            'be8fd185169b6423855e83f004269e0062c491ddcfb1ff2530e519f7b70fb6b6')

package() {
    install -Dm644 deluged    "$pkgdir/etc/dinit.d/deluged"
    install -Dm644 deluge-web "$pkgdir/etc/dinit.d/deluge-web"
}
