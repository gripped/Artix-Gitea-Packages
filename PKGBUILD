# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=radicale-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for radicale"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('radicale' 'dinit')
conflicts=('init-radicale')
provides=('init-radicale')
source=("radicale")
sha256sums=('beff5459a7a946fb406a2a609c338378fc598addc61d4bd1842727197d53fa10')

package() {
    install -Dm644 radicale "$pkgdir/etc/dinit.d/radicale"
}
