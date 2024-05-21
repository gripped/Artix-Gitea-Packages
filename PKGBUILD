# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apcupsd-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service script for apcupsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('apcupsd' 'dinit')
groups=('dinit-world')
provides=('init-apcupsd')
conflicts=('init-apcupsd')
source=("apcupsd")
sha256sums=('9082d83943995ed98ed693c69a87393653acc305e90fe2e59ec23e106cb6652f')

package() {
    install -Dm644 apcupsd "$pkgdir/etc/dinit.d/apcupsd"
}
