# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=qemu-guest-agent-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for qemu-guest-agent"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('qemu-guest-agent' 'dinit')
groups=('dinit-world')
conflicts=('init-qemu-guest-agent')
provides=('init-qemu-guest-agent')
source=("qemu-ga")
sha256sums=('f41a8364237e7dcddad442cf24f7d27587a500d877d359b0a385d3f44ff59608')

package() {
    install -Dm644 qemu-ga "$pkgdir/etc/dinit.d/qemu-ga"
}
