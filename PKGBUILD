# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=iptables-dinit
pkgver=20211029
pkgrel=5
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
sha256sums=('cbb5656220d7c2d27cd4f60e5853957664a45cd64757b4a7c2917e4756243b79'
            '6ef60692dfccc6a35e0b6ec35681b816f8ea6d3457f5221657587cbad97c6215')

package() {
    install -Dm644 iptables  "$pkgdir/etc/dinit.d/iptables"
    install -Dm644 ip6tables "$pkgdir/etc/dinit.d/ip6tables"
}
