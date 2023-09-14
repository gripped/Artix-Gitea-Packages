# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=privoxy-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for privoxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('privoxy' 'dinit')
conflicts=('init-privoxy')
provides=('init-privoxy')
source=("privoxy")
sha256sums=('30e01aef2e8865614dbd9f2c2e8def8e461d3a2c362fbb2d70eb7c829f720e69')

package() {
    install -Dm644 privoxy "$pkgdir/etc/dinit.d/privoxy"
}
