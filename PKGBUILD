# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=espeakup-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for espeakup"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('espeakup' 'dinit')
conflicts=('init-espeakup')
provides=('init-espeakup')
source=("espeakup" "espeakup-pre")
sha256sums=('1857169c0dfb65d348ec9d284bfdfc9803b27236236400cc5ebe6632a03c003a'
            '5aa8445c965619d103817f7409e76a9ecc25df84e8a1e140b2035b4e39c48ec4')

package() {
    install -Dm644 espeakup     "$pkgdir/etc/dinit.d/espeakup"
    install -Dm644 espeakup-pre "$pkgdir/etc/dinit.d/espeakup-pre"
}
