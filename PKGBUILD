# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=udpxy-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for udpxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('udpxy' 'dinit')
conflicts=('init-udpxy')
provides=('init-udpxy')
source=("udpxy")
sha256sums=('1224461a29d5e04157a5b9a85bd6879a5b1c4f4a963e364ea00b52203ad56808')

package() {
    install -Dm644 udpxy "$pkgdir/etc/dinit.d/udpxy"
}
