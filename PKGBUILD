# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=rpcbind-dinit
pkgver=20211029
pkgrel=4
pkgdesc="dinit service scripts for rpcbind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('rpcbind' 'dinit')
provides=('init-rpcbind')
conflicts=('init-rpcbind')
source=("rpcbind")
sha256sums=('812868fb316db31965f3aa56772c1f7851b181d744330bcb9a393795bbf04299')

package() {
    install -Dm644 rpcbind "$pkgdir/etc/dinit.d/rpcbind"
}
