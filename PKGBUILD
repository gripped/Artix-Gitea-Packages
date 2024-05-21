# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pdnsd-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for pdnsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pdnsd' 'dinit')
conflicts=('init-pdnsd')
provides=('init-pdnsd')
source=("pdnsd")
sha256sums=('fe6ef47b40d4bce8d05271f678044ee7209d3dee45f4d8f021893f19c0ee3c63')

package() {
    install -Dm644 pdnsd "$pkgdir/etc/dinit.d/pdnsd"
}
