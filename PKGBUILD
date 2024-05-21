# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=metalog-dinit
pkgver=20211026
pkgrel=2
pkgdesc="dinit service scripts for metalog"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('metalog' 'dinit')
conflicts=('init-metalog')
provides=('init-metalog')
source=("metalog")
sha256sums=('ad2236a7df3d3a5ba95a5a5a64330e0719c2191b92754878303601f34b254678')

package() {
    install -Dm644 metalog "$pkgdir/etc/dinit.d/metalog"
}
