# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dnsmasq-dinit
pkgver=20211206
pkgrel=2
pkgdesc="dinit service scripts for dnsmasq"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dnsmasq' 'dinit' 'dbus-dinit')
provides=('init-dnsmasq')
conflicts=('init-dnsmasq')
source=("dnsmasq")
sha256sums=('b4b793acf26672039beae1da7f7bc68c85c4ae32289add10a6b30224a975afd5')

package() {
    install -Dm644 dnsmasq "$pkgdir/etc/dinit.d/dnsmasq"
}
