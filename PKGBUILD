# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dnsmasq-dinit
pkgver=20211206
pkgrel=3
pkgdesc="dinit service scripts for dnsmasq"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dnsmasq' 'dinit' 'dbus-dinit')
provides=('init-dnsmasq')
conflicts=('init-dnsmasq')
source=("dnsmasq")
sha256sums=('6b187770f720270dc6cd6be1cf535533ae720d2d3bcf22c4e4787a9a550afd75')

package() {
    install -Dm644 dnsmasq "$pkgdir/etc/dinit.d/dnsmasq"
}
