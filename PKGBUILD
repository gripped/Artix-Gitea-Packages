# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=sane-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for sane"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sane' 'dinit')
conflicts=('init-sane')
provides=('init-sane')
source=("saned")
sha256sums=('5ca31be32b2296a112cdba36ec0c786bb37d0d5981a912eb90f98a69d551b30a')

package() {
    install -Dm644 saned "$pkgdir/etc/dinit.d/saned"
}
