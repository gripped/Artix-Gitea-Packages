# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=prosody-dinit
pkgver=20230915
pkgrel=1
pkgdesc="dinit service scripts for prosody"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('prosody' 'dinit')
provides=('init-prosody')
conflicts=('init-prosody')
source=("prosody" "prosody-pre")
sha256sums=('e10c3ffc2e6b00867a135aedcd8cb20b28d29040cd1d524bfefdfd21554ae359'
            'd7e61019d1bf311274f4a5249e83f33951feaf2fe1567a4d6fb7cbd4b16addc8')

package() {
    install -Dm644 prosody     "$pkgdir/etc/dinit.d/prosody"
    install -Dm644 prosody-pre "$pkgdir/etc/dinit.d/prosody-pre"
}
