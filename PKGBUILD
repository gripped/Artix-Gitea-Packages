# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mpd-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for mpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('mpd' 'dinit')
conflicts=('init-mpd')
provides=('init-mpd')
source=("mpd" "mpd-pre")
sha256sums=('2044e3f9257b39ccf8ab0a13b8f88d2dd3ef922f14837b73238bb31f97f8b699'
            '20d51180e54022560002ab2e658045361fbf73ba8c33103b4fa3dec08bc492de')

package() {
    install -Dm644 mpd     "$pkgdir/etc/dinit.d/mpd"
    install -Dm644 mpd-pre "$pkgdir/etc/dinit.d/mpd-pre"
}
