# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=syncthing-dinit
pkgver=20250816
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
source=("syncthing" "syncthing.user")
sha256sums=('cbeeef7b9a153225d2719014214a0a51add7ab8e100740736be0edd67eb4bbc0'
            '187a44748b99647187bc92594c336c9fbcc64b63897a66dd81e72343c0a4db95')
install=syncthing-dinit.install

package() {
    install -Dm644 syncthing.user "$pkgdir/etc/dinit.d/user/syncthing"
    install -Dm644 syncthing      "$pkgdir/etc/dinit.d/syncthing"
}
