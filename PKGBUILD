# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nginx-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for nginx"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('nginx' 'dinit')
conflicts=('init-nginx')
provides=('init-nginx')
source=("nginx")
sha256sums=('31355fe3eb59ce9938753608a572c0fcf8abd00a2153c2ecc9897ddbf6612fb0')

package() {
    install -Dm644 nginx "$pkgdir/etc/dinit.d/nginx"
}
