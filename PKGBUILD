# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=power-profiles-daemon-dinit
pkgver=20220514
pkgrel=2
pkgdesc="dinit service scripts for power-profiles-daemon"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('power-profiles-daemon' 'dbus-dinit' 'dinit')
conflicts=('init-power-profiles-daemon')
provides=('init-power-profiles-daemon')
source=("power-profiles-daemon")
sha256sums=('acea8091deef38e79159238f6a9fc3384204332c3ad23c03d721bca15830a06b')

package() {
    install -Dm644 power-profiles-daemon "$pkgdir/etc/dinit.d/power-profiles-daemon"
}
