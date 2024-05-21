# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=salt-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for salt"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('salt' 'dinit')
conflicts=('init-salt')
provides=('init-salt')
source=("salt-master"
        "salt-api"
        "salt-minion"
        "salt-syndic")
sha256sums=('8cee8eab8b55cf11b9ae5c32cfb820bf095dfcbecd5bdee25a71105080dfd77e'
            '8afb0828a11ac7f9a6357d55e01272e8b4afe59c8b74ce121d38931764b01ed5'
            '149682fd8a4cfa2e0d5b1bcd4c0cd29808e4d5bd962105fdd6b840899fb5e913'
            'e238bd4a8c6b4c1b9d2c298f6dcb247e4f73e982148b935e02dcaf1472f50581')

package() {
    install -Dm644 salt-master "$pkgdir/etc/dinit.d/salt-master"
    install -Dm644 salt-api    "$pkgdir/etc/dinit.d/salt-api"
    install -Dm644 salt-minion "$pkgdir/etc/dinit.d/salt-minion"
    install -Dm644 salt-syndic "$pkgdir/etc/dinit.d/salt-syndic"
}
