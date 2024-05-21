# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=i2pd-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for i2pd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('i2pd' 'dinit')
conflicts=('init-i2pd')
provides=('init-i2pd')
source=("i2pd")
sha256sums=('b12cbe200df310d3e33dbcf71dbd14d65cd65f54df05e3feb23633844664f68b')

package() {
    install -Dm644 i2pd "$pkgdir/etc/dinit.d/i2pd"
}
