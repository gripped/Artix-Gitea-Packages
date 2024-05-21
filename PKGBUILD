# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=elogind-dinit
pkgver=20240421
pkgrel=5
pkgdesc="dinit service scripts for elogind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('elogind' 'dinit' 'dbus-dinit')
provides=('init-elogind' 'init-logind')
conflicts=('init-elogind' 'init-logind')
groups=('dinit-system')
source=("elogind" "logind")
sha256sums=('bfa890ba3396c313c0bcc578a276fe45cc65506a7d0f59795340a753c7f8a214'
            'dd3401a038ffd16e9377fd80691210adc943a148effc5056a5424800ca00140c')

package() {
    install -Dm644 elogind    "$pkgdir/etc/dinit.d/elogind"
    install -Dm644 logind     "$pkgdir/etc/dinit.d/logind"

    # Add default
    install -d "$pkgdir/etc/dinit.d/boot.d"
    ln -sf ../logind "$pkgdir/etc/dinit.d/boot.d"
}
