# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=shairport-sync-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for shairport-sync"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('shairport-sync' 'dinit')
conflicts=('init-shairport-sync')
provides=('init-shairport-sync')
source=("shairport-sync")
sha256sums=('e19292fe1f345908d1035d5fbcfc6b62a48575ddc5e4d9a74cf6fb311a325166')

package() {
    install -Dm644 shairport-sync "$pkgdir/etc/dinit.d/shairport-sync"
}
