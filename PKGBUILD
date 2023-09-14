# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-relaysrv-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for syncthing-relaysrv"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('syncthing-relaysrv' 'dinit')
conflicts=('init-syncthing-relaysrv')
provides=('init-syncthing-relaysrv')
source=("syncthing-relaysrv")
sha256sums=('83aa8b54e1f536ccee25afce753250bc27e2d2b61ddea82b9ad8795fc82ee52b')

package() {
    install -Dm644 syncthing-relaysrv "$pkgdir/etc/dinit.d/syncthing-relaysrv"
}
