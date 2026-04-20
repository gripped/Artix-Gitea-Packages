# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=limine-snapper-sync-dinit
pkgver=20260420
pkgrel=1
pkgdesc="dinit service scripts for limine-snapper-sync"
arch=('any')
url="https://artixlinux.org"
license=('0BSD')
groups=('dinit-galaxy')
depends=('limine-snapper-sync' 'dinit')
conflicts=('init-limine-snapper-sync')
provides=('init-limine-snapper-sync')
source=("limine-snapper-sync")
sha256sums=('7259da08db2b55820cfad53a481f560e1c31faad8a0150063bc992ccb2c28fec')

package() {
    install -Dm644 limine-snapper-sync "$pkgdir/etc/dinit.d/limine-snapper-sync"
}
