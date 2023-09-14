# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pcsclite-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for pcsclite"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pcsclite' 'dinit')
conflicts=('init-pcsclite')
provides=('init-pcsclite')
source=("pcscd")
sha256sums=('4d7c038ecc59642efb3e1800939f5f6a84219579b92e6669157226ee7a45f9c7')

package() {
    install -Dm644 pcscd "$pkgdir/etc/dinit.d/pcscd"
}
