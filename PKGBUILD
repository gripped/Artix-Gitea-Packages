# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=bumblebee-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for bumblebee"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bumblebee' 'dinit')
conflicts=('init-bumblebee')
provides=('init-bumblebee')
source=("bumblebeed")
sha256sums=('91a3c17c71d743a83a2a3b451c59599c0553f5964f2679bb6ef811b451c4e0eb')

package() {
    install -Dm644 bumblebeed "$pkgdir/etc/dinit.d/bumblebeed"
}
