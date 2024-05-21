# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=seatd-dinit
pkgver=20230412
pkgrel=3
pkgdesc="dinit service scripts for seatd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('seatd' 'dinit')
conflicts=('init-seatd' 'init-logind' 'elogind-dinit')
provides=('init-seatd' 'init-logind' 'elogind-dinit')
source=("seatd" "logind")
sha256sums=('899f1665f2ec4ef8cd365a3a791d9861264ab3b12ad7fe8d7128778b138176c7'
            '0b9234d78851edaaae69408175f49f271aa1e1b0da7b2c3e3d32865e1d94781a')

package() {
    install -Dm644 seatd  "$pkgdir/etc/dinit.d/seatd"
    install -Dm644 logind "$pkgdir/etc/dinit.d/logind"
}
