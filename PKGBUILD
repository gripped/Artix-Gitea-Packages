# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=udpxy-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for udpxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('udpxy' 'dinit')
conflicts=('init-udpxy')
provides=('init-udpxy')
source=("udpxy")
sha256sums=('deb10705485b32cd3b3bba0444ff4548e5c73c8b5e67173d7aa62b86bda31af6')

package() {
    install -Dm644 udpxy "$pkgdir/etc/dinit.d/udpxy"
}
