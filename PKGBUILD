# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=backuppc-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for backuppc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('backuppc' 'dinit')
conflicts=('init-backuppc')
provides=('init-backuppc')
source=("backuppc")
sha256sums=('3418b3975b26ed3122b22f1af34080a4608a2241d158a950fb9d5b000005a42d')

package() {
    install -Dm644 backuppc "$pkgdir/etc/dinit.d/backuppc"
}
