# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=motion-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for motion"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('motion' 'dinit')
conflicts=('init-motion')
provides=('init-motion')
source=("motion")
sha256sums=('f724ddb85c4a98455373e002b21cbecdc0d473a819ee40cae192fbca5948affa')

package() {
    install -Dm644 motion "$pkgdir/etc/dinit.d/motion"
}
