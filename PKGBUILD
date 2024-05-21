# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=shairport-sync-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for shairport-sync"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('shairport-sync' 'dinit')
conflicts=('init-shairport-sync')
provides=('init-shairport-sync')
source=("shairport-sync")
sha256sums=('a89a1dd1088882193014ea20d70b62b1a222c400f28fd6d108c52c30655ce667')

package() {
    install -Dm644 shairport-sync "$pkgdir/etc/dinit.d/shairport-sync"
}
