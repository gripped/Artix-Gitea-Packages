# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dropbear-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for dropbear"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dropbear' 'dinit')
conflicts=('init-dropbear')
provides=('init-dropbear')
source=("dropbear")
sha256sums=('21e824b3ad96940a6890e21a54d5eb5db36aaa3f52d04f89317abf2e49cf7132')

package() {
    install -Dm644 dropbear "$pkgdir/etc/dinit.d/dropbear"
}
