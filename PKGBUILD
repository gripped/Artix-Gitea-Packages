# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fwknop-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for fwknop"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fwknop' 'dinit')
conflicts=('init-fwknop')
provides=('init-fwknop')
source=("fwknopd")
sha256sums=('7367fc145a2f4a84b631fb56314eb366528a0002a48d87128d5155040c6a4c97')

package() {
    install -Dm644 fwknopd "$pkgdir/etc/dinit.d/fwknopd"
}
