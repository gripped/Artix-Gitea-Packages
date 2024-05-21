# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tor-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for tor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tor' 'dinit')
conflicts=('init-tor')
provides=('init-tor')
source=("tor")
sha256sums=('fda2c69d612f50abbfd82eae48af4294052f1d6f76e395ef08a1cca62a4b6791')

package() {
    install -Dm644 tor "$pkgdir/etc/dinit.d/tor"
}
