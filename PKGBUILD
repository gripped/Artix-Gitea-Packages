# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tor-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for tor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tor' 'dinit')
conflicts=('init-tor')
provides=('init-tor')
source=("tor")
sha256sums=('6d969988fe585d69fc1795f82bfa46cf7979c8ef9e4504c1549c1c14540ee093')

package() {
    install -Dm644 tor "$pkgdir/etc/dinit.d/tor"
}
