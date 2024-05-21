# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=ddclient-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for ddclient"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ddclient' 'dinit')
conflicts=('init-ddclient')
provides=('init-ddclient')
source=("ddclient")
sha256sums=('1210f923784c1a71b5166d14ee8225a59437e60ce5c31cbefc85d476251ca205')

package() {
    install -Dm644 ddclient "$pkgdir/etc/dinit.d/ddclient"
}
