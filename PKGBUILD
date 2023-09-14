# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-dinit
pkgver=20230907
pkgrel=1
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
sha256sums=('b0ec361feffc4c1af1e70d7205e698c1ccffa0f6ee7f276149addf0ec4ede485')

package() {
    install -Dm644 syncthing      "$pkgdir/etc/dinit.d/syncthing"
}
