# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cyrus-sasl-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for cyrus-sasl"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('cyrus-sasl' 'dinit')
backup=('etc/dinit.d/config/saslauthd.conf')
conflicts=('init-cyrus-sasl')
provides=('init-cyrus-sasl')
source=("saslauthd"
        "saslauthd.conf")
sha256sums=('2eb69bf7b8d2e03bd1c716fbd3106f8939346094ca2217c5c9abff12409bc18b'
            '96364ecf3f6b3ba9de25eb176c851fc29a7d5c7d2f55da70b46e67e3cb2a2128')

package() {
    install -Dm644 saslauthd        "$pkgdir/etc/dinit.d/saslauthd"
    install -Dm644 saslauthd.conf   "$pkgdir/etc/dinit.d/config/saslauthd.conf"
}
