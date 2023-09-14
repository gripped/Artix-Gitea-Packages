# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=rng-tools-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for rng-tools"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rng-tools' 'dinit')
conflicts=('init-rng-tools')
provides=('init-rng-tools')
source=("rngd")
sha256sums=('3c91434d517d18370f3869cf133b137c804007f5344935ed42335d80e405916a')

package() {
    install -Dm644 rngd "$pkgdir/etc/dinit.d/rngd"
}
