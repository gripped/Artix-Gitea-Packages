# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=strongswan-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for strongswan"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('strongswan' 'dinit')
conflicts=('init-strongswan')
provides=('init-strongswan')
source=("strongswan")
sha256sums=('a388071ab0a6c8fc4f7c9f3e9186101430e7ba6b395017680379389fda1334ef')

package() {
    install -Dm644 strongswan "$pkgdir/etc/dinit.d/strongswan"
}
