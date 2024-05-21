# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for syncthing"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('syncthing' 'dinit')
conflicts=('init-syncthing')
provides=('init-syncthing')
backup=('etc/dinit.d/syncthing')
source=("syncthing")
sha256sums=('257d40f76077e4c5a5764924dc7ae72124a30ca8605708b70a3f5696b1e64719')

package() {
    install -Dm644 syncthing      "$pkgdir/etc/dinit.d/syncthing"
}
