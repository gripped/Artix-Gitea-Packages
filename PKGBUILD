# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=transmission-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for transmission"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'transmission-cli')
conflicts=('init-transmission')
provides=('init-transmission')
source=("transmission-daemon")
sha256sums=('d566b33e65e6832f5e627466b53baad7c2e248a1f24c77862f6c6c11e65e15f9')

package() {
    install -Dm644 transmission-daemon "$pkgdir/etc/dinit.d/transmission-daemon"
}
