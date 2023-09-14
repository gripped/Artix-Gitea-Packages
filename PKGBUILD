# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=usbguard-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for usbguard"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('usbguard' 'dinit')
groups=('dinit-world')
conflicts=('init-usbguard')
provides=('init-usbguard')
source=("usbguard")
sha256sums=('064ee71c726070c71c22c9f38ef6eb519c77d28053fe828bf3b9b40a59b6844a')

package() {
    install -Dm644 usbguard "$pkgdir/etc/dinit.d/usbguard"
}
