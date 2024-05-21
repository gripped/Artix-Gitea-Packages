# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dhcpcd-dinit
pkgver=20230205
pkgrel=3
pkgdesc="dinit service scripts for dhcpcd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('dhcpcd' 'dinit')
provides=('init-dhcpcd')
conflicts=('init-dhcpcd')
source=("dhcpcd")
sha256sums=('bbfe158ff9cd8c61515f206ae53e03794f4ff8f8416f2390a948685468ab940f')

package() {
    install -Dm644 dhcpcd "$pkgdir/etc/dinit.d/dhcpcd"
}
