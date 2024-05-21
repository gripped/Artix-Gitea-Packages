# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=ufw-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for ufw"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ufw' 'dinit')
conflicts=('init-ufw')
provides=('init-ufw')
source=("ufw")
sha256sums=('b34fa01b753794808b0c1ae1a4c2d143b7d94b59d09dedc61a2f433326359834')

package() {
    install -Dm644 ufw "$pkgdir/etc/dinit.d/ufw"
}
