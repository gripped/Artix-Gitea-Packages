# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pdnsd-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for pdnsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pdnsd' 'dinit')
conflicts=('init-pdnsd')
provides=('init-pdnsd')
source=("pdnsd")
sha256sums=('b4e825c2db63479d573f547bff412f5df234b90a19032d515f9ee3ff5f9ec8a6')

package() {
    install -Dm644 pdnsd "$pkgdir/etc/dinit.d/pdnsd"
}
