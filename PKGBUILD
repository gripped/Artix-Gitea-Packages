# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=postgrey-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for postgrey"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('postgrey' 'dinit')
conflicts=('init-postgrey')
provides=('init-postgrey')
source=("postgrey")
sha256sums=('c6f84f8441a0c7e457854a407de7fcf191c088b036d1202d5498b08d72388602')

package() {
    install -Dm644 postgrey "$pkgdir/etc/dinit.d/postgrey"
}
