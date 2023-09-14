# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=squid-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for squid"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('squid' 'dinit')
conflicts=('init-squid')
provides=('init-squid')
source=("squid")
sha256sums=('c295f483551684425d67a6d6ef95833be690f540e7ff6a1352458aad38865319')

package() {
    install -Dm644 squid "$pkgdir/etc/dinit.d/squid"
}
