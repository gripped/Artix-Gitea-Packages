# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=autofs-dinit
pkgver=20250621
pkgrel=2
pkgdesc="dinit service script for autofs"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('autofs' 'dinit')
groups=('dinit-galaxy')
conflicts=('init-autofs')
provides=('init-autofs')
source=("automount")
sha256sums=('c028019a74950a89955bb90647e1de20b75df99bf9401a577183ddd55af8bbc8')

package() {
    install -Dm644 automount "$pkgdir/etc/dinit.d/automount"
}
