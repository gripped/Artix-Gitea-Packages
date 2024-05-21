# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dhcp-dinit
pkgver=20230906
pkgrel=3
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
sha256sums=('d679d14357e503b43f913ab9774a2f025dd1d7f25e1b1bc17c1c38ab035c3a2a'
            '92106a2d1da616f99facb2cdf702736d22f700d53daf864b0267410cc8328c3f'
            '13787089e7b4700ac59e40bbe10bb14d537054d04b7c004ee76025eeba1f07e7'
            '1c1c544d6aa285da3306fb4a33dc089f166eaa4872688c4e331e01008176240a'
            '1bb8bdbee0770a3645de4c95f322d3cef1db9c00870acbe69ed9909ffe2e37d6')

package() {
    install -Dm644 dhclient         "$pkgdir/etc/dinit.d/dhclient"
    install -Dm644 dhcpd4           "$pkgdir/etc/dinit.d/dhcpd4"
    install -Dm644 dhcpd6           "$pkgdir/etc/dinit.d/dhcpd6"
    install -Dm644 dhcpd-pre        "$pkgdir/etc/dinit.d/dhcpd-pre"
    install -Dm755 dhcpd-pre.script "$pkgdir/usr/lib/dinit/pre/dhcpd"
}
