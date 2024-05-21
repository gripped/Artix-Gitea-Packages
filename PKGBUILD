# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fcgiwrap-dinit
pkgver=20220424
pkgrel=3
pkgdesc="dinit service scripts for fcgiwrap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fcgiwrap' 'dinit')
conflicts=('init-fcgiwrap')
provides=('init-fcgiwrap')
source=("fcgiwrap")
sha256sums=('f28c5da1695a4097232ef74df4d4cf5f69dc1659b59e2f7c4eeafdb643c8962e')

package() {
    install -Dm644 fcgiwrap "$pkgdir/etc/dinit.d/fcgiwrap"
}
