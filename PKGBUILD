# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=iwd-dinit
pkgver=20240622
pkgrel=1
pkgdesc="dinit service scripts for iwd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('iwd' 'dinit')
conflicts=('init-iwd')
provides=('init-iwd')
source=("iwd" "ead")
sha256sums=('3e0413b7a9e89f9cc30f81b3c634066905a141a372dfa1b6df09a2f398eff035'
            'bc647d57643faf5e9972c71ffd74c05d4b3151c5a02b190ea9a7b0e7c1aa58f9')

package() {
    install -Dm644 iwd "$pkgdir/etc/dinit.d/iwd"
    install -Dm644 ead "$pkgdir/etc/dinit.d/ead"
}
