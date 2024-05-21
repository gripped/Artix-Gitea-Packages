# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=xinetd-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for xinetd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xinetd' 'dinit')
provides=('init-xinetd')
conflicts=('init-xinetd')
source=("xinetd")
sha256sums=('8ca5a1e149c5c8ea4ab3d9af91b6b0ca1042ddc04624d8eb525145e3ee2260d2')

package() {
    install -Dm644 xinetd "$pkgdir/etc/dinit.d/xinetd"
}
