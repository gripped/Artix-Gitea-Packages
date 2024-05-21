# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=backuppc-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for backuppc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('backuppc' 'dinit')
conflicts=('init-backuppc')
provides=('init-backuppc')
source=("backuppc")
sha256sums=('2f9573823eeabf29126440651c9c69b773652a5fb92534c5a61f74965926e417')

package() {
    install -Dm644 backuppc "$pkgdir/etc/dinit.d/backuppc"
}
