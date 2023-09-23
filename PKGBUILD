# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=lxd-dinit
pkgver=20211121
pkgrel=3
pkgdesc="dinit service scripts for lxd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lxd' 'dinit')
conflicts=('init-lxd')
provides=('init-lxd')
source=("lxd" "lxd.script")
sha256sums=('cb7ddc3a7e8cd0ca2a06be415acfbec1241fc57cc7f11bd12daa443fd8d7d599'
            '05121a9a1c7d066a4f95a087c6791a6eafe48a624517f6de37fc0e3f81c7dbd7')

package() {
    install -Dm644 lxd        "$pkgdir/etc/dinit.d/lxd"
    install -Dm755 lxd.script "$pkgdir/usr/lib/dinit/lxd"
}
