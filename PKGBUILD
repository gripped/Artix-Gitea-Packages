# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=coturn-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for coturn"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('coturn' 'dinit')
conflicts=('init-coturn')
provides=('init-coturn')
source=("coturn")
sha256sums=('69e5ef6d46d7d5a6cf9666bd55b86a5e8415cdd2641bcbb5990533e49472247e')

package() {
    install -Dm644 coturn "$pkgdir/etc/dinit.d/coturn"
}
