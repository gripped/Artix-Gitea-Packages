# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=alsa-utils-dinit
pkgver=20211025
pkgrel=4
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
sha256sums=('69f0307e500481c476a4b4fb903d36162b3cb63eaca0baf3337a015fd405e913')

package() {
    install -d "$pkgdir/etc/dinit.d"
    install -Dm644 alsa "$pkgdir/etc/dinit.d/alsa"
}
