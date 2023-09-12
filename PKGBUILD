# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openntpd-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service scripts for openntpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('openntpd' 'dinit')
groups=('dinit-world')
conflicts=('init-openntpd' 'init-timed' 'ntp')
provides=('init-openntpd' 'init-timed')
source=("ntpd")
sha256sums=('924efd99264be21efaf45e283d41442aa90f91d48d46f4817a1f6fb3d9e424df')

package() {
    mkdir -p "$pkgdir/etc/dinit.d"
    install -Dm644 ntpd "$pkgdir/etc/dinit.d"
}
