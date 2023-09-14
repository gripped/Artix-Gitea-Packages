# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=toxcore-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for toxcore"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('toxcore' 'dinit')
conflicts=('init-toxcore')
provides=('init-toxcore')
source=("toxbootstrapd")
sha256sums=('0cc13295065471eebe498de599a000ed9bbf3c9e5d043f346e6bb63e7ea92a12')

package() {
    install -Dm644 toxbootstrapd "$pkgdir/etc/dinit.d/toxbootstrapd"
}
