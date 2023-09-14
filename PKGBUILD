# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=xinetd-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for xinetd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xinetd' 'dinit')
provides=('init-xinetd')
conflicts=('init-xinetd')
source=("xinetd")
sha256sums=('f31948f9b7520c43d1bd0abc732ef778ca8edb92f6b0064e5e40239349c3feea')

package() {
    install -Dm644 xinetd "$pkgdir/etc/dinit.d/xinetd"
}
