# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=vnstat-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for vnstat"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('vnstat' 'dinit')
conflicts=('init-vnstat')
provides=('init-vnstat')
source=("vnstatd")
sha256sums=('308050ec91458ef4ba0a5fde5760f8342ebd1976412adb902b4b61849d7cd485')

package() {
    install -Dm644 vnstatd "$pkgdir/etc/dinit.d/vnstatd"
}
