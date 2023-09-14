# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sslh-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for sslh"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sslh' 'dinit')
conflicts=('init-sslh')
provides=('init-sslh')
source=("sslh")
sha256sums=('9a0e99a34f11ffcc07a0774a57d2dc1da81b8f5a346f43a0cb7dc4dbc7772163')

package() {
    install -Dm644 sslh "$pkgdir/etc/dinit.d/sslh"
}
