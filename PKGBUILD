# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pcsclite-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for pcsclite"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pcsclite' 'dinit')
conflicts=('init-pcsclite')
provides=('init-pcsclite')
source=("pcscd")
sha256sums=('7a576613d2ef45983bc85923ece4a77da4f6feac46d3bdd0f7a7596b8fc687d3')

package() {
    install -Dm644 pcscd "$pkgdir/etc/dinit.d/pcscd"
}
