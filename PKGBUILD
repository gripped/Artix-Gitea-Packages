# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=coturn-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for coturn"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('coturn' 'dinit')
conflicts=('init-coturn')
provides=('init-coturn')
source=("coturn")
sha256sums=('2aee2087962b17af15154c8260ed71c72e88765124494d26f778fd2a03e34b40')

package() {
    install -Dm644 coturn "$pkgdir/etc/dinit.d/coturn"
}
