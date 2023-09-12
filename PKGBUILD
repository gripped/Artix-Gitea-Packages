# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openvpn-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for openvpn"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
provides=('init-openvpn')
conflicts=('init-openvpn')
groups=('dinit-world')
depends=('openvpn')
source=("openvpn")
sha256sums=('97e7facf0642b44563ecbdef160780e882f93d0107640c5f5e9278591e7d3649')

package() {
    install -Dm644 openvpn "$pkgdir/etc/dinit.d/openvpn"
}
