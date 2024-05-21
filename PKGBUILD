# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sslh-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for sslh"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sslh' 'dinit')
conflicts=('init-sslh')
provides=('init-sslh')
source=("sslh")
sha256sums=('0f418235e954626e2a9817b1985f5fb880d048f873660bba3029637895bb058b')

package() {
    install -Dm644 sslh "$pkgdir/etc/dinit.d/sslh"
}
