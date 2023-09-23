# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=stunnel-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for stunnel"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('stunnel' 'dinit')
conflicts=('init-stunnel')
provides=('init-stunnel')
source=("stunnel" "stunnel.script")
sha256sums=('dbd4c2ec8ea6d6ef1a008cda0488decf3d3c519fb399a062ff402fdb021be90f'
            'd138a4506abb5c088398a2d241c4dda2fbf03a43b5c18a580c3395101195174e')

package() {
    install -Dm644 stunnel        "$pkgdir/etc/dinit.d/stunnel"
    install -Dm755 stunnel.script "$pkgdir/usr/lib/dinit/stunnel"
}
