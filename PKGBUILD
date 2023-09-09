# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apache-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service scripts for apache"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('apache' 'dinit')
conflicts=('init-apache')
provides=('init-apache')
source=("apache")
sha256sums=('bcd7adacc0ced4d094254acd0e53b80efa0719610723ebf49d382c0920ae5eb2')

package() {
    install -Dm644 apache "$pkgdir/etc/dinit.d/apache"
}
