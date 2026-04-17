# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=i2pd-dinit
pkgver=20260417
pkgrel=1
pkgdesc="dinit service scripts for i2pd"
arch=('any')
url="https://artixlinux.org"
license=('0BSD')
groups=('dinit-world')
depends=('i2pd' 'dinit')
conflicts=('init-i2pd')
provides=('init-i2pd')
source=("i2pd")
sha256sums=('9def8da3ee00879742a9b810f43622c8dac03026476fd3c9dbeb7656cadc3f83')

package() {
    install -Dm644 i2pd "$pkgdir/etc/dinit.d/i2pd"
}
