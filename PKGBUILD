# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pptpd-dinit
pkgver=20211105
pkgrel=3
pkgdesc="dinit service scripts for pptpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pptpd' 'dinit')
conflicts=('init-pptpd')
provides=('init-pptpd')
source=("pptpd")
sha256sums=('9338542cec2c51a03494f867412b3eee8318222856cd60685045f008c6d5dcea')

package() {
    install -Dm644 pptpd "$pkgdir/etc/dinit.d/pptpd"
}
