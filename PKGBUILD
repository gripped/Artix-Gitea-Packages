# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=consul-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for consul"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('consul' 'dinit')
conflicts=('init-consul')
provides=('init-consul')
source=("consul")
sha256sums=('c83c701fe5860ff11330189f72319926728553a34fe7642c85cb425119c68e72')

package() {
    install -Dm644 consul "$pkgdir/etc/dinit.d/consul"
}
