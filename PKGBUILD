# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=usbguard-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service script for usbguard"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('usbguard' 'dinit')
groups=('dinit-world')
conflicts=('init-usbguard')
provides=('init-usbguard')
source=("usbguard")
sha256sums=('2bbd9fe35e0824aa6b309c4b78fc5d741d67e3f846c61ea4242f453bb7e8ed54')

package() {
    install -Dm644 usbguard "$pkgdir/etc/dinit.d/usbguard"
}
