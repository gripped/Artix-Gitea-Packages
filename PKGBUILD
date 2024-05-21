# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lirc-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for lirc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lirc' 'dinit')
conflicts=('init-lirc')
provides=('init-lirc')
source=("lircd")
sha256sums=('f8d90d0ad5114ae76ee0ed1582c66e027150ca89ce754887ef3827e397c3d33c')

package() {
    install -Dm644 lircd "$pkgdir/etc/dinit.d/lircd"
}
