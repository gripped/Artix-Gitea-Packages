# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=ipset-dinit
pkgver=20240525
pkgrel=2
pkgdesc="dinit service scripts for ipset"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ipset' 'dinit' 'iptables-dinit')
provides=('init-ipset')
conflicts=('init-ipset')
source=("ipset")
sha256sums=('9a69e39fd6260e57a31287088e3f27ffc9343211d8b8254c7f6aeec0bbe79a6e')

package() {
    install -Dm644 ipset "$pkgdir/etc/dinit.d/ipset"
}
