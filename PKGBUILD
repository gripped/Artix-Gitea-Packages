# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=transmission-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for transmission"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'transmission-cli')
conflicts=('init-transmission')
provides=('init-transmission')
source=("transmission-daemon")
sha256sums=('8174ad270f5a6c7b76e55f7150d00751764dba87a96f110d82745c797ed7bfc0')

package() {
    install -Dm644 transmission-daemon "$pkgdir/etc/dinit.d/transmission-daemon"
}
