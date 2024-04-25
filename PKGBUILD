# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=elogind-dinit
pkgver=20240421
pkgrel=3
pkgdesc="dinit service scripts for elogind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('elogind' 'dinit' 'dbus-dinit')
provides=('init-elogind' 'init-logind')
conflicts=('init-elogind' 'init-logind')
groups=('dinit-system')
source=("elogind-cg" "elogind" "logind")
sha256sums=('321b61753b32faa9c144f1a5db06ac74bd5090c15cb288b0972e609dad091fd7'
            '2f4773414d768608302209a689535f3e96718daddb28d2d9af07f86434f1f57e'
            'dd3401a038ffd16e9377fd80691210adc943a148effc5056a5424800ca00140c')

package() {
    install -Dm644 elogind-cg "$pkgdir/etc/dinit.d/elogind-cg"
    install -Dm644 elogind    "$pkgdir/etc/dinit.d/elogind"
    install -Dm644 logind     "$pkgdir/etc/dinit.d/logind"

    # Add default
    install -d "$pkgdir/etc/dinit.d/boot.d"
    ln -sf ../logind "$pkgdir/etc/dinit.d/boot.d"
}
