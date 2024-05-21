# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openvpn-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for openvpn"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
provides=('init-openvpn')
conflicts=('init-openvpn')
groups=('dinit-world')
depends=('openvpn')
source=("openvpn")
sha256sums=('f83a04e912cf512bbd0724cf851a2365fafd192471c58586f20f07a867abcee5')

package() {
    install -Dm644 openvpn "$pkgdir/etc/dinit.d/openvpn"
}
