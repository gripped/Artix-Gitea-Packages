# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=power-profiles-daemon-dinit
pkgver=20220514
pkgrel=3
pkgdesc="dinit service scripts for power-profiles-daemon"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('power-profiles-daemon' 'dbus-dinit' 'dinit')
conflicts=('init-power-profiles-daemon')
provides=('init-power-profiles-daemon')
source=("power-profiles-daemon")
sha256sums=('1097ec9adf37480cb88b06d21b7c944f67ac7c6c4e6a2f5126c0617fc4a3c795')

package() {
    install -Dm644 power-profiles-daemon "$pkgdir/etc/dinit.d/power-profiles-daemon"
}
