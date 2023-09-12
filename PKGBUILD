# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nftables-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for nftables"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('nftables' 'dinit')
groups=('dinit-world')
conflicts=('init-nftables')
provides=('init-nftables')
source=("nftables")
sha256sums=('6cd24310639c4beb4157f9117eaab8681fe072c5d484473d585d7a5a5b217d87')

package() {
    install -Dm644 nftables "$pkgdir/etc/dinit.d/nftables"
}
