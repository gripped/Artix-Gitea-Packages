# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openntpd-dinit
pkgver=20211025
pkgrel=4
pkgdesc="dinit service scripts for openntpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('openntpd' 'dinit')
groups=('dinit-world')
conflicts=('init-openntpd' 'init-timed' 'ntp')
provides=('init-openntpd' 'init-timed')
source=("ntpd")
sha256sums=('bd2658aebb50886d3b5a5e78f683d0348b366805bfa39e9c0b7602206dc045fa')

package() {
    mkdir -p "$pkgdir/etc/dinit.d"
    install -Dm644 ntpd "$pkgdir/etc/dinit.d"
}
