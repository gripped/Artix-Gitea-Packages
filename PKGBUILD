# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=rng-tools-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for rng-tools"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rng-tools' 'dinit')
conflicts=('init-rng-tools')
provides=('init-rng-tools')
source=("rngd")
sha256sums=('33511d7d9bf176dec0d8a78f7941832c0c17a77f0cbf46a1171db0353521bc3e')

package() {
    install -Dm644 rngd "$pkgdir/etc/dinit.d/rngd"
}
