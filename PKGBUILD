# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=vnstat-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for vnstat"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('vnstat' 'dinit')
conflicts=('init-vnstat')
provides=('init-vnstat')
source=("vnstatd")
sha256sums=('401745fc873711a39797cb66d73d6b6b6d13185993e793362bc3659fe28d6481')

package() {
    install -Dm644 vnstatd "$pkgdir/etc/dinit.d/vnstatd"
}
