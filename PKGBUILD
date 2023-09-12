# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lirc-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for lirc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lirc' 'dinit')
conflicts=('init-lirc')
provides=('init-lirc')
source=("lircd")
sha256sums=('daa64d23d2e8f599ecca7fb7d07dba1d3e245028c5ae990be86db232b3716ce6')

package() {
    install -Dm644 lircd "$pkgdir/etc/dinit.d/lircd"
}
