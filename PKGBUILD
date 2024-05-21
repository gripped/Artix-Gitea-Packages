# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=firewalld-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for firewalld"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('firewalld' 'dinit' 'dbus-dinit')
conflicts=('init-firewalld')
provides=('init-firewalld')
source=("firewalld")
sha256sums=('6f2c332e8b0bf84da327907c4a1579567fde961110a4f0f95c9b044834056df0')

package() {
    install -Dm644 firewalld "$pkgdir/etc/dinit.d/firewalld"
}
