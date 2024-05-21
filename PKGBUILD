# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=iwd-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for iwd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('iwd' 'dinit')
conflicts=('init-iwd')
provides=('init-iwd')
source=("iwd")
sha256sums=('9d9968cc127f673637b37d273d4f9b1a112c5b15cb119cad99970c2db9a40201')

package() {
    install -Dm644 iwd "$pkgdir/etc/dinit.d/iwd"
}
