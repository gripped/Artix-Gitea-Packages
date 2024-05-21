# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=rsync-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for rsync"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rsync' 'dinit')
conflicts=('init-rsync')
provides=('init-rsync')
source=("rsync")
sha256sums=('eb22ae4285bee288eb5653233b1b8f01f43dca43c260345b580cec8276d3c142')

package() {
    install -Dm644 rsync "$pkgdir/etc/dinit.d/rsync"
}
