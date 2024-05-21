# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=openfire-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for openfire"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('openfire' 'dinit')
conflicts=('init-openfire')
provides=('init-openfire')
source=("openfire")
sha256sums=('06cfb82e3256f359edcd28d2c44c7f84ddbcd9d1158b4beb614300613bbe4991')

package() {
    install -Dm644 openfire "$pkgdir/etc/dinit.d/openfire"
}
