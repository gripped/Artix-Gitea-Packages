# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=rpcbind-dinit
pkgver=20211029
pkgrel=5
pkgdesc="dinit service scripts for rpcbind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('rpcbind' 'dinit')
provides=('init-rpcbind')
conflicts=('init-rpcbind')
source=("rpcbind")
sha256sums=('880f09eae6f91f1ca742e07c81d07d779fdd538428e5b9a6ef823f12df939ce7')

package() {
    install -Dm644 rpcbind "$pkgdir/etc/dinit.d/rpcbind"
}
