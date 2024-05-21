# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=iptables-dinit
pkgver=20211029
pkgrel=6
pkgdesc="dinit service scripts for iptables"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('iptables' 'dinit')
provides=('init-iptables')
conflicts=('init-iptables')
source=("iptables"
        "ip6tables")
sha256sums=('a18badc95e43f86209f2206a254ad723773e85b64aa4d84cae7b573b07a898c3'
            '1bcc7368bb75dcbe8436f6a312da1d6d29225753ff1d99b31f0596b16d9159ca')

package() {
    install -Dm644 iptables  "$pkgdir/etc/dinit.d/iptables"
    install -Dm644 ip6tables "$pkgdir/etc/dinit.d/ip6tables"
}
