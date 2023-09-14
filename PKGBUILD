# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=trojan-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for trojan"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('trojan' 'dinit')
conflicts=('init-trojan')
provides=('init-trojan')
source=("trojan")
sha256sums=('9ec3aff69d5df0659a811183edd40f6edc6ca6eb2ac8706fec893f63b8d1d58b')

package() {
    install -Dm644 trojan "$pkgdir/etc/dinit.d/trojan"
}
