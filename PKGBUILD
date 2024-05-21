# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bluez-dinit
pkgver=20211026
pkgrel=2
pkgdesc="dinit service scripts for bluez"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('bluez' 'init-dbus')
groups=('dinit-world')
provides=('init-bluez')
conflicts=('init-bluez')
source=("bluetoothd")
sha256sums=('da2b163561668b97c2f4550023716f36171438aa0f02d0b9de2bd23a209bbb7d')

package() {
    install -Dm644 bluetoothd "$pkgdir/etc/dinit.d/bluetoothd"
}
