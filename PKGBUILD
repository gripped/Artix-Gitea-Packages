# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postfix-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for postfix"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('postfix' 'dinit')
provides=('init-postfix')
conflicts=('init-postfix')
source=("postfix" "postfix-pre")
sha256sums=('ca14cfeae69b6434119aefff37dd448f74fa4bbd641f3c2453cf64ce11597618'
            'b058cd7aa4c1c23672a6bcc775c4d558752dcc3ab87236c364706dcd250b0366')

package() {
    install -Dm644 postfix     "$pkgdir/etc/dinit.d/postfix"
    install -Dm644 postfix-pre "$pkgdir/etc/dinit.d/postfix-pre"
}
