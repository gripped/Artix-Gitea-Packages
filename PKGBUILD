# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=motion-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for motion"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('motion' 'dinit')
conflicts=('init-motion')
provides=('init-motion')
source=("motion")
sha256sums=('dc8afd8744965f298f40de86f86a560dc1a488495cdba1c85ea4a5d6061431ba')

package() {
    install -Dm644 motion "$pkgdir/etc/dinit.d/motion"
}
