# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgbase=mpd-dinit
pkgname=('mpd-dinit' 'mpd-dinit-user')
pkgver=20240610
pkgrel=1
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('mpd')
source=("mpd" "mpd-pre" "mpd.user")
sha256sums=('57df359d3b5c5cb1823fbfe91c1d569b4ed70e8a03433ea84993c0fb0ea1460f'
            '54d6152854f66b4e06e98293eb70d955dff08b4532363e87c76d0801e129ac97'
            '1dabe47e4c6a8087d32f6def99785dc87f01c0aebe32fb5f19253f7549c876a9')

package_mpd-dinit() {
    depends+=('dinit')
    groups=('dinit-galaxy')
    provides=('init-mpd')
    conflicts=('init-mpd')
    pkgdesc="dinit service scripts for mpd"
    install -Dm644 mpd     "$pkgdir/etc/dinit.d/mpd"
    install -Dm644 mpd-pre "$pkgdir/etc/dinit.d/mpd-pre"
}

package_mpd-dinit-user() {
    pkgdesc="dinit user service script for mpd"
    depends+=('dinit-base' 'turnstile')
    groups=('dinit-user-services')
    install -Dm644 mpd.user "$pkgdir/etc/dinit.d/user/mpd"
}
