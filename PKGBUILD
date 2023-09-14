# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=spotifyd-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for spotifyd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('spotifyd' 'dinit')
conflicts=('init-spotifyd')
provides=('init-spotifyd')
source=("spotifyd")
sha256sums=('7d995503df35fe005db4d5b50e4fda43a8cf8f4b9d792decdd3c3ba70a66e288')

package() {
    install -Dm644 spotifyd "$pkgdir/etc/dinit.d/spotifyd"
}
