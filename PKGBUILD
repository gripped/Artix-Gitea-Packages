# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cyrus-sasl-dinit
pkgver=20230907
pkgrel=2
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
sha256sums=('69583b373abcc8afc0e8f8241b4d503c484394dae447793ede89d300e4451130'
            '96364ecf3f6b3ba9de25eb176c851fc29a7d5c7d2f55da70b46e67e3cb2a2128')

package() {
    install -Dm644 saslauthd        "$pkgdir/etc/dinit.d/saslauthd"
    install -Dm644 saslauthd.conf   "$pkgdir/etc/dinit.d/config/saslauthd.conf"
}
