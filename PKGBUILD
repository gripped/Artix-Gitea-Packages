# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=openfire-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for openfire"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('openfire' 'dinit')
conflicts=('init-openfire')
provides=('init-openfire')
source=("openfire")
sha256sums=('32bd306bc4629e81a9c0322fb7d0ad121cfdb3510b33b174dad2fbe755f29541')

package() {
    install -Dm644 openfire "$pkgdir/etc/dinit.d/openfire"
}
