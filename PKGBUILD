# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=trojan-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for trojan"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('trojan' 'dinit')
conflicts=('init-trojan')
provides=('init-trojan')
source=("trojan")
sha256sums=('ce8fe18c292f3d18a69bfc493650d8aed7577fde81486409254949edc2036e81')

package() {
    install -Dm644 trojan "$pkgdir/etc/dinit.d/trojan"
}
