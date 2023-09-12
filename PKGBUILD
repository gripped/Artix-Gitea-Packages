# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=knot-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for knot"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('knot' 'dinit')
conflicts=('init-knot')
provides=('init-knot')
source=("knotd")
sha256sums=('4c5100ec46046b104d7339d9aaa57e8d1b7456904d9d19eb4f6381d173fd896e')

package() {
    install -Dm644 knotd "$pkgdir/etc/dinit.d/knotd"
}
