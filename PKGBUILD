# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mpd-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for mpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('mpd' 'dinit')
conflicts=('init-mpd')
provides=('init-mpd')
source=("mpd" "mpd-pre")
sha256sums=('53aa6bc4a2eb2c27545c0e0f1973651a61ecd27f3bc3f97ce4612fbf14d7b8f0'
            '54d6152854f66b4e06e98293eb70d955dff08b4532363e87c76d0801e129ac97')

package() {
    install -Dm644 mpd     "$pkgdir/etc/dinit.d/mpd"
    install -Dm644 mpd-pre "$pkgdir/etc/dinit.d/mpd-pre"
}
