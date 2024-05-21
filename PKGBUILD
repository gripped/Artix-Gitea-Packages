# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nftables-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service script for nftables"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('nftables' 'dinit')
groups=('dinit-world')
conflicts=('init-nftables')
provides=('init-nftables')
source=("nftables")
sha256sums=('eed65170e4a1fe8ca317d648030b2a19c93bcefb48594ce2e781f86d94423868')

package() {
    install -Dm644 nftables "$pkgdir/etc/dinit.d/nftables"
}
