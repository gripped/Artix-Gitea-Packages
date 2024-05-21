# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=strongswan-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for strongswan"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('strongswan' 'dinit')
conflicts=('init-strongswan')
provides=('init-strongswan')
source=("strongswan")
sha256sums=('b5c923e13c7524a2974fd00623304d02d73997345e15aecda633948b91320cc3')

package() {
    install -Dm644 strongswan "$pkgdir/etc/dinit.d/strongswan"
}
