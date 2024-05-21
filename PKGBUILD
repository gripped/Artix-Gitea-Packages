# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=shairplay-dinit
pkgver=20211102
pkgrel=4
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
sha256sums=('a95b67df2878b8ad7ec2c0bb48c0d9401d7877fae3f5ca0c3079eaf15368b1c2'
            '10adc414fc6c692d7edcac8b6edb6506a4617859e984e0d01c9feed2f6e38b9f')

package() {
    # Due to shairplay config file containing password, it will be 600 instead of 644.
    install -Dm644 shairplay      "$pkgdir/etc/dinit.d/shairplay"
    install -Dm600 shairplay.conf "$pkgdir/etc/dinit.d/config/shairplay.conf"
}
