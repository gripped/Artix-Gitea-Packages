# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=qemu-guest-agent-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service script for qemu-guest-agent"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('qemu-guest-agent' 'dinit')
groups=('dinit-world')
conflicts=('init-qemu-guest-agent')
provides=('init-qemu-guest-agent')
source=("qemu-ga")
sha256sums=('235fbbc5a4bbc56aa2e1a50293df8bd44c07d711ccfb3be7df66bdedd1c4a14c')

package() {
    install -Dm644 qemu-ga "$pkgdir/etc/dinit.d/qemu-ga"
}
