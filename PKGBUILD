# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=radicale-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for radicale"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('radicale' 'dinit')
conflicts=('init-radicale')
provides=('init-radicale')
source=("radicale")
sha256sums=('f9a56f62166d54f5f5ec0f82c4552571f8f579fb43fcef412d5db43043e7f3e3')

package() {
    install -Dm644 radicale "$pkgdir/etc/dinit.d/radicale"
}
