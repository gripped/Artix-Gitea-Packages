# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=haveged-dinit
pkgver=20211026
pkgrel=3
pkgdesc="dinit service scripts for haveged"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('haveged' 'dinit')
conflicts=('init-haveged')
provides=('init-haveged')
source=("haveged")
sha256sums=('0f5bca41e37f58991e3b4f1916d0f53c3163dc357f043a2ef756aa28504d8ebf')

package() {
    install -Dm644 haveged "$pkgdir/etc/dinit.d/haveged"
}
