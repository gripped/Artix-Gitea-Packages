# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=thermald-dinit
pkgver=20211103
pkgrel=2
pkgdesc="dinit service scripts for thermald"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('thermald' 'dinit')
conflicts=('init-thermald')
provides=('init-thermald')
source=("thermald")
sha256sums=('4cf20b153fb9cb2d68c206c97507016eb281b8c49eae901c25ebf32b590bd9b6')

package() {
    install -Dm644 thermald "$pkgdir/etc/dinit.d/thermald"
}
