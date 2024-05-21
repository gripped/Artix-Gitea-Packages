# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=networkmanager-dinit
pkgver=20230912
pkgrel=2
pkgdesc="dinit service scripts for networkmanager"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('networkmanager' 'dbus-dinit')
conflicts=('init-networkmanager')
provides=('init-networkmanager')
source=("NetworkManager")
sha256sums=('83b847d1ebeeae14e389e359c03b7d4ec3c8134d9e7020fe30e0e23309402923')

package() {
    install -Dm644 NetworkManager "$pkgdir/etc/dinit.d/NetworkManager"
}
