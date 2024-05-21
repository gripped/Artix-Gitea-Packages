# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=boinc-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for boinc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('boinc' 'dinit')
conflicts=('init-boinc')
provides=('init-boinc')
source=("boinc")
sha256sums=('dbd78b2a88d66aea72a3fa284f239dc573b48414c1688d11735a37ff87b3b7ca')

package() {
    install -Dm644 boinc "$pkgdir/etc/dinit.d/boinc"
}
