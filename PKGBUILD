# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=hostapd-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for hostapd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('hostapd' 'dinit')
conflicts=('init-hostapd')
provides=('init-hostapd')
source=("hostapd")
sha256sums=('24108dd2593b6248cdf533690d7e0e356d2ad3f563aee9ea8332fb7f27a88b67')

package() {
    install -Dm644 hostapd "$pkgdir/etc/dinit.d/hostapd"
}
