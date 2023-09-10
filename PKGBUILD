# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=connman-dinit
pkgver=20211026
pkgrel=2
pkgdesc="dinit service scripts for connman"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('connman' 'dbus-dinit')
groups=('dinit-world')
provides=('init-connman')
conflicts=('init-connman')
source=("connmand")
sha256sums=('ad8e7a27e1197d6bc0c0b6b1a0c037b6dce3d4d06432550ee8aa0916446b4560')

package() {
    install -Dm644 connmand "$pkgdir/etc/dinit.d/connmand"
}
