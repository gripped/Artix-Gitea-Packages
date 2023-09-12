# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=hostapd-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for hostapd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('hostapd' 'dinit')
conflicts=('init-hostapd')
provides=('init-hostapd')
source=("hostapd")
sha256sums=('f95a5384b3d8ae17822c5fe246048fa4af51884d40cd225c353ecbcfb1b6d618')

package() {
    install -Dm644 hostapd "$pkgdir/etc/dinit.d/hostapd"
}
