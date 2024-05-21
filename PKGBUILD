# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=haveged-dinit
pkgver=20211026
pkgrel=4
pkgdesc="dinit service scripts for haveged"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('haveged' 'dinit')
conflicts=('init-haveged')
provides=('init-haveged')
source=("haveged")
sha256sums=('ebec1eb6bbeee8cf774f7fb13f0ce9194798a2ce6f51352848bbbb376d81ef9e')

package() {
    install -Dm644 haveged "$pkgdir/etc/dinit.d/haveged"
}
