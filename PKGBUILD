# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=colord-dinit
pkgver=20211030
pkgrel=2
pkgdesc="dinit service script for colord"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('colord' 'dinit' 'dbus-dinit')
groups=('dinit-world')
conflicts=('init-colord')
provides=('init-colord')
source=("colord" "colord-pre" "colord-session")
sha256sums=('e1c2dd3cecd8f310d5be458611e3cd2698fbcb005c38eec7b328a6a57048c779'
            '2a25b9e9199d2849599f303bf10bbad11580a88086e90efc2a73b79d7be9cd64'
            '91a38b745fc1841d1d2d43746181892a331228919a8b2059db78c93c7a4c00d7')

package() {
    install -Dm644 colord         "$pkgdir/etc/dinit.d/colord"
    install -Dm644 colord-pre     "$pkgdir/etc/dinit.d/colord-pre"
    install -Dm644 colord-session "$pkgdir/etc/dinit.d/colord-session"
}
