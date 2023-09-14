# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=stubby-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for stubby"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('stubby' 'dinit')
conflicts=('init-stubby')
provides=('init-stubby')
source=("stubby")
sha256sums=('4bc16fac60d6b2dfafd6104a8ba634aee2a285ef6d6d696bf33ddd47e15c9a0f')

package() {
    install -Dm644 stubby "$pkgdir/etc/dinit.d/stubby"
}
