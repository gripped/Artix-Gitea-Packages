# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=elogind-dinit
pkgver=20240421
pkgrel=1
pkgdesc="dinit service scripts for elogind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('elogind' 'dinit' 'dbus-dinit')
provides=('init-elogind' 'init-logind')
conflicts=('init-elogind' 'init-logind')
groups=('dinit-system')
source=("elogind-cg" "elogind" "logind")
sha256sums=('0e940ff908450e9d8143c44318af353652f7afa1b7d44721a925f659d0b9a96b'
            '36cd69b32966757ff56d6c92d047b0f607be239036bacdfea957287bdd98ea1b'
            'dd3401a038ffd16e9377fd80691210adc943a148effc5056a5424800ca00140c')

package() {
    install -Dm644 elogind-cg "$pkgdir/etc/dinit.d/elogind-cg"
    install -Dm644 elogind    "$pkgdir/etc/dinit.d/elogind"
    install -Dm644 logind     "$pkgdir/etc/dinit.d/logind"

    # Add default
    install -d "$pkgdir/etc/dinit.d/boot.d"
    ln -sf ../logind "$pkgdir/etc/dinit.d/boot.d"
}
