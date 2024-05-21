# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=freeradius-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for freeradius"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('freeradius' 'dinit')
conflicts=('init-freeradius')
provides=('init-freeradius')
source=("radiusd")
sha256sums=('5c7d3207f4b6220d8146754ce5fba8d59075a06e810cc6dbf86fbd9d48941c45')

package() {
    install -Dm644 radiusd "$pkgdir/etc/dinit.d/radiusd"
}
