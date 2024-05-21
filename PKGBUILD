# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cups-dinit
pkgver=20211025
pkgrel=2
pkgdesc="dinit service scripts for cups"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('cups' 'dbus-dinit')
conflicts=('init-cups')
provides=('init-cups')
source=("cupsd")
sha256sums=('b3630abb30fdb8413cdc5cf6506decb65603c11611cd81c1512fa87c6dfd24b0')

package() {
    install -Dm644 cupsd "$pkgdir/etc/dinit.d/cupsd"
}
