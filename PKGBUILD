# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=acpid-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service script for acpid"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('acpid' 'dinit')
groups=('dinit-world')
provides=('init-acpid')
conflicts=('init-acpid')
source=("acpid")
sha256sums=('8183c717c6ca2a8ce0879a782446d08b0249fc9d089f8fd5284195892a668b3a')

package() {
    install -Dm644 acpid "$pkgdir/etc/dinit.d/acpid"
}
