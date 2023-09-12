# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=matterbridge-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for matterbridge"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('matterbridge' 'dinit')
conflicts=('init-matterbridge')
provides=('init-matterbridge')
source=("matterbridge")
sha256sums=('8852b2c1e4f2925890c216b4771fc883b4fe2d70d4e7671506f86eebb8f51905')

package() {
    install -Dm644 matterbridge "$pkgdir/etc/dinit.d/matterbridge"
}
