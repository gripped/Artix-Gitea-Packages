# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-relaysrv-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for syncthing-relaysrv"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('syncthing-relaysrv' 'dinit')
conflicts=('init-syncthing-relaysrv')
provides=('init-syncthing-relaysrv')
source=("syncthing-relaysrv")
sha256sums=('024326ca001ad941c0ccb4ad79e8fec26f4091cfc630175892701a55747b38dc')

package() {
    install -Dm644 syncthing-relaysrv "$pkgdir/etc/dinit.d/syncthing-relaysrv"
}
