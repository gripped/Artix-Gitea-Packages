# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=iwd-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for iwd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('iwd' 'dinit')
conflicts=('init-iwd')
provides=('init-iwd')
source=("iwd")
sha256sums=('f7b3a500d8ad1c5c99581a648eeb985944ffe704eeebac2ca7286ff3e6d39801')

package() {
    install -Dm644 iwd "$pkgdir/etc/dinit.d/iwd"
}
