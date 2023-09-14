# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=salt-dinit
pkgver=20211102
pkgrel=3
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
sha256sums=('7931f313a54d211181d614e16c0a111d3fecb0e1289c4f8fad92a55d900a4160'
            '0cee3b4a5a131b0e4f09962dc1f739f830b71b7b52d098bbcfad61a0b4e23259'
            '0d80ef6ac4714ab7b37fd17c357530e7b40b86c7e39f09a2e8f73a60299bf8d1'
            '37a465cd2aba77179b8157f04ae7c72e2b40448b220a5a6b421ea94612b761dc')

package() {
    install -Dm644 salt-master "$pkgdir/etc/dinit.d/salt-master"
    install -Dm644 salt-api    "$pkgdir/etc/dinit.d/salt-api"
    install -Dm644 salt-minion "$pkgdir/etc/dinit.d/salt-minion"
    install -Dm644 salt-syndic "$pkgdir/etc/dinit.d/salt-syndic"
}
