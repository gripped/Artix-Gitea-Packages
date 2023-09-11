# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dhcp-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service scripts for dhcp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'dhcp')
provides=('init-dhcp')
conflicts=('init-dhcp')
source=("dhclient"
        "dhcpd4"
        "dhcpd6"
        "dhcpd-pre"
        "dhcpd-pre.script")
sha256sums=('40c26ce54b5caa13988d382fac5cc665c22c24c88946de5cd7f01aa15c184095'
            'acbdab442205018179652bbea3ece66df8bf41eea268ebf0dfe3999f0a119e53'
            '169f035e0faf41271b0ad3c44df3e72f959274c9e003cc03657e7a4552255474'
            '3ef8d1480a22ca2c71b8b55d1b008a9594f8925df12bcdba9aa5e3888af8ef57'
            '1bb8bdbee0770a3645de4c95f322d3cef1db9c00870acbe69ed9909ffe2e37d6')

package() {
    install -Dm644 dhclient         "$pkgdir/etc/dinit.d/dhclient"
    install -Dm644 dhcpd4           "$pkgdir/etc/dinit.d/dhcpd4"
    install -Dm644 dhcpd6           "$pkgdir/etc/dinit.d/dhcpd6"
    install -Dm644 dhcpd-pre        "$pkgdir/etc/dinit.d/dhcpd-pre"
    install -Dm755 dhcpd-pre.script "$pkgdir/etc/dinit.d/scripts/dhcpd-pre"
}
