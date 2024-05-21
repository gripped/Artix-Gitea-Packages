# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=squid-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for squid"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('squid' 'dinit')
conflicts=('init-squid')
provides=('init-squid')
source=("squid")
sha256sums=('24a82f5851b95a76218dada05f21b567a43333e452a51b8bf3a63c505c89c7de')

package() {
    install -Dm644 squid "$pkgdir/etc/dinit.d/squid"
}
