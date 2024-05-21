# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=interception-tools-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for interception-tools"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-galaxy')
depends=('interception-tools' 'dinit')
conflicts=('init-interception-tools')
provides=('init-interception-tools')
source=("udevmon")
sha256sums=('f0af744a24d3b5a7e563795b7bd1490678aa5f5ac9fcb5c27005a8496fc8ac40')

package() {
    install -Dm644 udevmon "$pkgdir/etc/dinit.d/udevmon"
}
