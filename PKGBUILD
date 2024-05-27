# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bluez-dinit
pkgver=20211026
pkgrel=3
pkgdesc="dinit service scripts for bluez"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('bluez' 'init-dbus' 'dinit-rc')
groups=('dinit-world')
provides=('init-bluez')
conflicts=('init-bluez')
source=("bluetoothd")
sha256sums=('dee82518b2c994963e76ff279d5f33aa82ee9a1b2d9c02de6ba4332e46248dfd')

package() {
    install -Dm644 bluetoothd "$pkgdir/etc/dinit.d/bluetoothd"
}
