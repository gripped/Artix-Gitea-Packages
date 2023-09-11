# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dhcpcd-dinit
pkgver=20230205
pkgrel=2
pkgdesc="dinit service scripts for dhcpcd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('dhcpcd' 'dinit')
provides=('init-dhcpcd')
conflicts=('init-dhcpcd')
source=("dhcpcd")
sha256sums=('c93ff7dc88487ab5a3e2bea47ee1a0422face4aa00955ce5d29cd918600e54d7')

package() {
    install -Dm644 dhcpcd "$pkgdir/etc/dinit.d/dhcpcd"
}
