# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=unrealircd-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for unrealircd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('unrealircd' 'dinit')
conflicts=('init-unrealircd')
provides=('init-unrealircd')
source=("unrealircd")
sha256sums=('29dc1cd5ff582aa13d0923d9f5836606a1c8a036709f17143c0720c5bd3eee76')

package() {
    install -Dm644 unrealircd "$pkgdir/etc/dinit.d/unrealircd"
}
