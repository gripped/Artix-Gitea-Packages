# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=ufw-dinit
pkgver=20211103
pkgrel=2
pkgdesc="dinit service scripts for ufw"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ufw' 'dinit')
conflicts=('init-ufw')
provides=('init-ufw')
source=("ufw")
sha256sums=('b4dbfe26b7326477e55b0a37981e2bce008f446784f76320e5b4617b8c09152c')

package() {
    install -Dm644 ufw "$pkgdir/etc/dinit.d/ufw"
}
