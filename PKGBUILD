# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apache-dinit
pkgver=20211025
pkgrel=4
pkgdesc="dinit service scripts for apache"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('apache' 'dinit')
conflicts=('init-apache')
provides=('init-apache')
source=("apache")
sha256sums=('74efb0cf051b2d4a740ee0b6e657795f3409e8a0fdfe8ef74ddbe71bfd5a59b9')

package() {
    install -Dm644 apache "$pkgdir/etc/dinit.d/apache"
}
