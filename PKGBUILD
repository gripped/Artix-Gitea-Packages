# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=connman-dinit
pkgver=20211026
pkgrel=3
pkgdesc="dinit service scripts for connman"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('connman' 'dbus-dinit')
groups=('dinit-world')
provides=('init-connman')
conflicts=('init-connman')
source=("connmand")
sha256sums=('69c693389fa9506ca78e7bb9879c730aac42600e3587941bfebdfd1d87c59b66')

package() {
    install -Dm644 connmand "$pkgdir/etc/dinit.d/connmand"
}
