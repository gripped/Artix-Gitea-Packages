# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=bolt-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for bolt"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bolt' 'dinit')
conflicts=('init-bolt')
provides=('init-bolt')
source=("boltd")
sha256sums=('1712f2432d1de39c435bb7310a20e25af8d953a23e89a8e0612b431ac198bbb3')

package() {
    install -Dm644 boltd "$pkgdir/etc/dinit.d/boltd"
}
