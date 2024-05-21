# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=stubby-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for stubby"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('stubby' 'dinit')
conflicts=('init-stubby')
provides=('init-stubby')
source=("stubby")
sha256sums=('0a323ec5eef815483f71f5d8aa537dcf03255ba73a93e4cbb69515a6482fb1d9')

package() {
    install -Dm644 stubby "$pkgdir/etc/dinit.d/stubby"
}
