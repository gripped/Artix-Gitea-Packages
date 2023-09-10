# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=consul-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for consul"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('consul' 'dinit')
conflicts=('init-consul')
provides=('init-consul')
source=("consul")
sha256sums=('847a4018d0326e7f897b847823e90e3675c3ca427964b968a8aefc18f55f18e0')

package() {
    install -Dm644 consul "$pkgdir/etc/dinit.d/consul"
}
