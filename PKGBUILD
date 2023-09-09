# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=brltty-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service scripts for brltty"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('brltty' 'dinit')
provides=('init-brltty')
conflicts=('init-brltty')
source=("brltty" "brltty-pre")
sha256sums=('9540fb42322c3ce596b295ee37896d3e6fb4425f90331f7215bafbaca52c5970'
            'bd351f972086406540f0fb59789f0218e2d67957643b82b92f2fc4af4ab14523')

package() {
    install -Dm644 brltty     "$pkgdir/etc/dinit.d/brltty"
    install -Dm755 brltty-pre "$pkgdir/etc/dinit.d/brltty-pre"
}
