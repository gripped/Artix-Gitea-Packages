# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=lxd-dinit
pkgver=20211121
pkgrel=4
pkgdesc="dinit service scripts for lxd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lxd' 'dinit')
conflicts=('init-lxd')
provides=('init-lxd')
source=("lxd" "lxd.script")
sha256sums=('0455420380e5c2ab95e5cd5571c0878ba5bd3ee2dd1aaa578fa3283fc109628a'
            '05121a9a1c7d066a4f95a087c6791a6eafe48a624517f6de37fc0e3f81c7dbd7')

package() {
    install -Dm644 lxd        "$pkgdir/etc/dinit.d/lxd"
    install -Dm755 lxd.script "$pkgdir/usr/lib/dinit/lxd"
}
