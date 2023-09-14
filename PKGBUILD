# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=znc-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for znc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('znc' 'dinit')
conflicts=('init-znc')
provides=('init-znc')
source=("znc")
sha256sums=('8cd596dbd45a09f18aadabd758307a06c71a50061a06684852f968a208ec4ddc')

package() {
    install -Dm644 znc "$pkgdir/etc/dinit.d/znc"
}
