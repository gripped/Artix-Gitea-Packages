# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=exim-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for exim"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('exim' 'dinit')
conflicts=('init-exim')
provides=('init-exim')
source=("exim")
sha256sums=('bde51125c6972337cad3f110334e98148d90b99a25f5e6977698e826b834a366')

package() {
    install -Dm644 exim "$pkgdir/etc/dinit.d/exim"
}
