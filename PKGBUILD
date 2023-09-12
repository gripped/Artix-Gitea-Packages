# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=freeradius-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for freeradius"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('freeradius' 'dinit')
conflicts=('init-freeradius')
provides=('init-freeradius')
source=("radiusd")
sha256sums=('38a2a1bda068739c02eceecb592058b85e8305d69243dd2e170698b599c95037')

package() {
    install -Dm644 radiusd "$pkgdir/etc/dinit.d/radiusd"
}
