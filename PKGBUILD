# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=alsa-utils-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service scripts for alsa-utils"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('alsa-utils' 'dinit')
provides=('init-alsa-utils')
conflicts=('init-alsa-utils')
install=alsa-utils-dinit.install
source=("alsa")
sha256sums=('f07ba810bb5d6dfba13ec7313c8829c87d72b54d3f4cc9f51ffd76542b08c0d3')

package() {
    install -d "$pkgdir/etc/dinit.d"
    install -Dm644 alsa "$pkgdir/etc/dinit.d/alsa"
}
