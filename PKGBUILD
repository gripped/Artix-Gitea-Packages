# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openvswitch-dinit
pkgver=20240618
pkgrel=1
pkgdesc="dinit service scripts for openvswitch"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('openvswitch' 'dinit')
conflicts=('init-openvswitch')
provides=('init-openvswitch')
source=("ovsdb-server" "ovs-vswitchd-pre" "ovs-vswitchd")
sha256sums=('69f2b79b5c623fbdb77378c160d19fea945a5571e6a401a2394084505d86f34a'
            '34b8c2ac651da0beff728e2650305a0f4805da5a7835fb8bdd74a6f2cb6dc30f'
            '805f74c5eafcb713721da1b144effe793ae119c94c1020bd8535ffd8d505e1d8')

package() {
    install -Dm644 ovsdb-server     "$pkgdir/etc/dinit.d/ovsdb-server"
    install -Dm644 ovs-vswitchd-pre "$pkgdir/etc/dinit.d/ovs-vswitchd-pre"
    install -Dm644 ovs-vswitchd     "$pkgdir/etc/dinit.d/ovs-vswitchd"
}
