# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=unbound-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for unbound"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('unbound' 'dinit')
conflicts=('init-unbound')
provides=('init-unbound')
source=("unbound")
sha256sums=('d635c05fca233c68c1b76d278555feda18a7495ff53b40525bc9a2603170b42d')

package() {
    install -Dm644 unbound "$pkgdir/etc/dinit.d/unbound"
}
