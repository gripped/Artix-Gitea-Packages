# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sndio-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for sndio"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sndio' 'dinit')
conflicts=('init-sndio')
provides=('init-sndio')
source=("sndiod")
sha256sums=('689a151b4bd5d46321afd3afb964c25f9a7ba42be4391b228637d2023331ec77')

package() {
    install -Dm644 sndiod "$pkgdir/etc/dinit.d/sndiod"
}
