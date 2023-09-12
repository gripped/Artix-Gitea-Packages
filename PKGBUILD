# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=networkmanager-dinit
pkgver=20230912
pkgrel=1
pkgdesc="dinit service scripts for networkmanager"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('networkmanager' 'dbus-dinit')
conflicts=('init-networkmanager')
provides=('init-networkmanager')
source=("NetworkManager")
sha256sums=('dd83f7f25cd5f91b66c5835a985a0f6db2883282ae63d302d2ee6c06555cb5a3')

package() {
    install -Dm644 NetworkManager "$pkgdir/etc/dinit.d/NetworkManager"
}
