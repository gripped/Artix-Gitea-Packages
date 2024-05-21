# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=znc-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for znc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('znc' 'dinit')
conflicts=('init-znc')
provides=('init-znc')
source=("znc")
sha256sums=('6ce1849d35f8f90b1b4cafd195e22b30d0be4bb70445b8bd05f4a7cef017f7d0')

package() {
    install -Dm644 znc "$pkgdir/etc/dinit.d/znc"
}
