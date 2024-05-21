# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=knot-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for knot"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('knot' 'dinit')
conflicts=('init-knot')
provides=('init-knot')
source=("knotd")
sha256sums=('7eb22b14a01f5b6ec6268ff86f9de661e8e8aaaf3e0b12efb7f502cb60772ede')

package() {
    install -Dm644 knotd "$pkgdir/etc/dinit.d/knotd"
}
