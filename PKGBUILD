# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=docker-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service script for docker"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('docker' 'dinit')
groups=('dinit-world')
provides=('init-docker')
conflicts=('init-docker')
source=("dockerd" "dockerd.script")
sha256sums=('8efadcca4e451349307dd988f74694ea9b9b946af5841019e6bfc48f0a5ee451'
            '7fcda58e7782fe7a846275aa26cdc0d76291f035789023774f33ced2e97021aa')

package() {
    install -Dm644 dockerd        "$pkgdir/etc/dinit.d/dockerd"
    install -Dm755 dockerd.script "$pkgdir/usr/lib/dinit/dockerd"
}
