# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=matterbridge-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for matterbridge"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('matterbridge' 'dinit')
conflicts=('init-matterbridge')
provides=('init-matterbridge')
source=("matterbridge")
sha256sums=('c0756433c4bbdce9276837af23b5749c075ad07d6e4b0cb0e196516cf493027a')

package() {
    install -Dm644 matterbridge "$pkgdir/etc/dinit.d/matterbridge"
}
