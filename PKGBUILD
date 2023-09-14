# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=shairplay-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for shairplay"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('shairplay' 'dinit')
conflicts=('init-shairplay')
provides=('init-shairplay')
backup=('etc/dinit.d/config/shairplay.conf')
source=("shairplay" "shairplay.conf")
sha256sums=('f372c3930a0fc5e0f2a85a056a80dc67d956aeb77b56b849daf0e57a3ded2b04'
            '10adc414fc6c692d7edcac8b6edb6506a4617859e984e0d01c9feed2f6e38b9f')

package() {
    # Due to shairplay config file containing password, it will be 600 instead of 644.
    install -Dm644 shairplay      "$pkgdir/etc/dinit.d/shairplay"
    install -Dm600 shairplay.conf "$pkgdir/etc/dinit.d/config/shairplay.conf"
}
