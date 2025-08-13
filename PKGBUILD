# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-dinit
pkgver=20250814
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
sha256sums=('bf4ce8c25251e267515bac6a435aaa2687487566f1c707f0c81c694937be0d21')

package() {
    install -Dm644 syncthing      "$pkgdir/etc/dinit.d/syncthing"
}
