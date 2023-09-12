# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fcgiwrap-dinit
pkgver=20220424
pkgrel=2
pkgdesc="dinit service scripts for fcgiwrap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fcgiwrap' 'dinit')
conflicts=('init-fcgiwrap')
provides=('init-fcgiwrap')
source=("fcgiwrap")
sha256sums=('e99dbd259d1f3936f587e6726d8192e24cae68c0aba976a7bb13280db9d28d75')

package() {
    install -Dm644 fcgiwrap "$pkgdir/etc/dinit.d/fcgiwrap"
}
