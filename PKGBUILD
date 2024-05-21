# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tlp-dinit
pkgver=20211103
pkgrel=2
pkgdesc="dinit service scripts for tlp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tlp' 'dinit')
conflicts=('init-tlp')
provides=('init-tlp')
source=("tlp")
sha256sums=('e96d800fdd15b500948ae615974c7e7339f9f99797c00b17a3eb59aff39d8f15')

package() {
    install -Dm644 tlp "$pkgdir/etc/dinit.d/tlp"
}
