# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=exim-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for exim"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('exim' 'dinit')
conflicts=('init-exim')
provides=('init-exim')
source=("exim")
sha256sums=('680b48b9df7610052203412677c0094c340cae7d70553cb07d6deabc9cab2924')

package() {
    install -Dm644 exim "$pkgdir/etc/dinit.d/exim"
}
