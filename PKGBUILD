# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=opensips-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for opensips"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('opensips' 'dinit')
conflicts=('init-opensips')
provides=('init-opensips')
source=("opensips")
sha256sums=('fa1e1fff47190e8a1aac312c284bd5eac042b8f2f61173d520946b2075c163f2')

package() {
    install -Dm644 opensips "$pkgdir/etc/dinit.d/opensips"
}
