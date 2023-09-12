# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=ejabberd-dinit
pkgver=20230912
pkgrel=1
pkgdesc="dinit service scripts for ejabberd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ejabberd' 'dinit')
provides=('init-ejabberd')
conflicts=('init-ejabberd')
source=("ejabberd")
sha256sums=('36a24861fbb4b1761ddfbf01e22cbcc411d15aad2d62dab5c3a0737eb5bf888e')

package() {
    install -Dm644 ejabberd        "$pkgdir/etc/dinit.d/ejabberd"
}
