# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apcupsd-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service script for apcupsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('apcupsd' 'dinit')
groups=('dinit-world')
provides=('init-apcupsd')
conflicts=('init-apcupsd')
source=("apcupsd")
sha256sums=('ba1eb6c905c8364083463c521e6fc218b2c45cd4e974aee37e9f5c5136351b4f')

package() {
    install -Dm644 apcupsd "$pkgdir/etc/dinit.d/apcupsd"
}
