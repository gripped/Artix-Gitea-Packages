# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=wireguard-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service script for wireguard"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('wireguard-tools' 'dinit')
groups=('dinit-world')
conflicts=('init-wireguard')
provides=('init-wireguard')
backup=('etc/dinit.d/config/wireguard.conf')
source=("wireguard"
        "wireguard.conf")
sha256sums=('451885ba338cfd49bd4d97c8bc39a00bec69d35e8dcd5cb4cfd003ee5b46919d'
            'f0c721724c2c4dbaf9b9a71654b7847660af4b1f6b505946fc4f6e19a06b67f1')

package() {
    install -Dm644 wireguard      "$pkgdir/etc/dinit.d/wireguard"
    install -Dm644 wireguard.conf "$pkgdir/etc/dinit.d/config/wireguard.conf"
}
