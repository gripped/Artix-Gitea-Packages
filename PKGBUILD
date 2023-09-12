# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=i2pd-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for i2pd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('i2pd' 'dinit')
conflicts=('init-i2pd')
provides=('init-i2pd')
source=("i2pd")
sha256sums=('e9502a5e832a684f7efb89e5ed1d3d9cf6a8e23bcbd8fd89afd7b64d9adaa1be')

package() {
    install -Dm644 i2pd "$pkgdir/etc/dinit.d/i2pd"
}
