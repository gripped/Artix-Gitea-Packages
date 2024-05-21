# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=unrealircd-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for unrealircd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('unrealircd' 'dinit')
conflicts=('init-unrealircd')
provides=('init-unrealircd')
source=("unrealircd")
sha256sums=('8c8786d5ef33f3444c5a75475974f90eabccbed9522840f1f48c4f0604858b10')

package() {
    install -Dm644 unrealircd "$pkgdir/etc/dinit.d/unrealircd"
}
